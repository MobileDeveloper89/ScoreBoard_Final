
#import "Game.h"
#import "Packet.h"
#import "PacketServerReady.h"
#import "PacketSignInResponse.h"
#import "PacketOtherClientQuit.h"
#import "Player.h"

#import "PacketChangedBorderIndex.h"
#import "PacketLeftIncrease.h"
#import "PacketRightIncrease.h"

#import "PacketLeftSwipe.h"
#import "PacketRightSwipe.h"

#import "PacketTypeLeftLabelName.h"
#import "PacketTypeRightLabelName.h"
#import "PacketTypePeriodNumber.h"
#import "PacketTypeTimerLabels.h"
#import "PacketTypeTimer2Labels.h"

#import "global.h"

// For faking missed ActivatePlayer messages.
//PlayerPosition testPosition;

typedef enum
{
	GameStateWaitingForSignIn,
	GameStateWaitingForReady,
	GameStateDealing,
	GameStatePlaying,
	GameStateGameOver,
	GameStateQuitting,
}
GameState;

@implementation Game
{
	GameState _state;
    
	GKSession *_session;
	NSString *_serverPeerID;
	NSString *_localPlayerName;
	int _sendPacketNumber;
    
	NSMutableDictionary *_players;
    
	BOOL _firstTime;
	BOOL _busyDealing;
	BOOL _hasTurnedCard;
	BOOL _haveSnap;
	BOOL _mustPayCards;
	NSMutableSet *_matchingPlayers;
}

@synthesize delegate = _delegate;
@synthesize isServer = _isServer;

- (id)init
{
	if ((self = [super init]))
	{
		_players = [[NSMutableDictionary alloc] init];
		_matchingPlayers = [NSMutableSet setWithCapacity:4];
	}
	return self;
}

- (void)dealloc
{
#ifdef DEBUG
	NSLog(@"dealloc %@", self);
#endif
    [super dealloc];
}

- (void) startServerGameWithSession:(GKSession *)session playerName:(NSString *)name clients:(NSArray *)clients
{
	self.isServer = YES;
    
	_session = session;
	_session.available = NO;
	_session.delegate = self;
	[_session setDataReceiveHandler:self withContext:nil];
    
	_state = GameStateWaitingForSignIn;
    [self.delegate boardisServer:YES];
	//[self.delegate gameWaitingForClientsReady:self];
    
	// Create the Player object for the server.
	Player *player = [[Player alloc] init];
	player.peerID = _session.peerID;
	[_players setObject:player forKey:player.peerID];
    [self.delegate boardisServer:YES];
    
	// Add a Player object for each client.
    
	Packet *packet = [Packet packetWithType:PacketTypeSignInRequest];
	[self sendPacketToAllClients:packet];
}


#pragma mark - Game Logic

- (void) startClientGameWithSession:(GKSession *)session playerName:(NSString *)name server:(NSString *)peerID
{
	self.isServer = NO;
    
	_session = session;
	_session.available = NO;
	_session.delegate = self;
	[_session setDataReceiveHandler:self withContext:nil];
    
	_serverPeerID = peerID;
    _localPlayerName = name;
    
	_state = GameStateWaitingForSignIn;
    [self.delegate boardisServer:NO];
    
	//[self.delegate gameWaitingForServerReady:self];
}

- (void) quitGameWithReason:(QuitReason)reason
{
    //    isBluetooth = NO;
    
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
    
	_state = GameStateQuitting;
    
	if (reason == QuitReasonUserQuit)
	{
		if (self.isServer)
		{
			Packet *packet = [Packet packetWithType:PacketTypeServerQuit];
			[self sendPacketToAllClients:packet];
		}
		else
		{
			Packet *packet = [Packet packetWithType:PacketTypeClientQuit];
			[self sendPacketToServer:packet];
		}
	}
    
	[_session disconnectFromAllPeers];
	_session.delegate = nil;
	_session = nil;
    
	[self.delegate game:self didQuitWithReason:reason];
}

- (void)beginGame
{
	_state = GameStateDealing;
	_firstTime = YES;
    
	// This prevents the player from turning over cards while the dealing
	// animation is still taking place.
	_busyDealing = YES;
    
	[self.delegate gameDidBegin:self];
    
	if (self.isServer)
	{
		
	}
}


- (void)beginRound
{
	_busyDealing = NO;
	_hasTurnedCard = NO;
	_haveSnap = NO;
	_mustPayCards = NO;
	[_matchingPlayers removeAllObjects];
    
}


#pragma mark - Networking

- (void)sendPacketToAllClients:(Packet *)packet
{
	if (packet.packetNumber != -1)
		packet.packetNumber = _sendPacketNumber++;
    
	[_players enumerateKeysAndObjectsUsingBlock:^(id key, Player *obj, BOOL *stop)
     {
         obj.receivedResponse = [_session.peerID isEqualToString:obj.peerID];
     }];
    
	GKSendDataMode dataMode = packet.sendReliably ? GKSendDataReliable : GKSendDataUnreliable;
    
	NSData *data = [packet data];
	NSError *error;
	if (![_session sendDataToAllPeers:data withDataMode:dataMode error:&error])
	{
		NSLog(@"Error sending data to clients: %@", error);
	}
}

- (void)sendPacketToServer:(Packet *)packet
{
    
	if (packet.packetNumber != -1)
		packet.packetNumber = _sendPacketNumber++;
    
	GKSendDataMode dataMode = packet.sendReliably ? GKSendDataReliable : GKSendDataUnreliable;
    
	NSData *data = [packet data];
	NSError *error;
	if (![_session sendData:data toPeers:[NSArray arrayWithObject:_serverPeerID] withDataMode:dataMode error:&error])
	{
		NSLog(@"Error sending data to server: %@", error);
	}
}

- (Player *)playerWithPeerID:(NSString *)peerID
{
	return [_players objectForKey:peerID];
}

- (BOOL)receivedResponsesFromAllPlayers
{
	for (NSString *peerID in _players)
	{
		Player *player = [self playerWithPeerID:peerID];
		if (!player.receivedResponse)
			return NO;
	}
	return YES;
}


- (void)clientDidDisconnect:(NSString *)peerID redistributedCards:(NSDictionary *)redistributedCards
{
	if (_state != GameStateQuitting)
	{
		Player *player = [self playerWithPeerID:peerID];
		if (player != nil)
		{
			[_players removeObjectForKey:peerID];
            
			if (_state != GameStateWaitingForSignIn)
			{
				// Tell the other clients that this one is now disconnected.
				// Give the cards of the disconnected player to the others.
				if (self.isServer)
				{
					redistributedCards = [self redistributeCardsOfDisconnectedPlayer:player];
                    
					PacketOtherClientQuit *packet = [PacketOtherClientQuit packetWithPeerID:peerID cards:redistributedCards];
					[self sendPacketToAllClients:packet];
				}
                
				// Add the new cards to the bottom of the closed piles.
				[redistributedCards enumerateKeysAndObjectsUsingBlock:^(id key, NSArray *array, BOOL *stop)
                 {
                     Player *player = [self playerWithPeerID:key];
                     if (player != nil)
                     {
                     }
                 }];
                
				[self.delegate game:self playerDidDisconnect:player redistributedCards:redistributedCards];
			}
		}
	}
}

- (NSDictionary *)redistributeCardsOfDisconnectedPlayer:(Player *)disconnectedPlayer
{
	NSMutableDictionary *playerCards = [[NSMutableDictionary alloc] init];
    
	[_players enumerateKeysAndObjectsUsingBlock:^(id key, Player *obj, BOOL *stop)
     {
         if (obj != disconnectedPlayer)
         {
             NSMutableArray *array = [NSMutableArray arrayWithCapacity:26];
             [playerCards setObject:array forKey:key];
         }
     }];
    
	return playerCards;
}




#pragma mark - GKSessionDelegate

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state
{
#ifdef DEBUG
	NSLog(@"Game: peer %@ changed state %d", peerID, state);
#endif
	
	if (state == GKPeerStateDisconnected)
	{
		if (self.isServer)
		{
			[self clientDidDisconnect:peerID redistributedCards:nil];
		}
		else if ([peerID isEqualToString:_serverPeerID])
		{
			[self quitGameWithReason:QuitReasonConnectionDropped];
		}
	}
}

- (void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID
{
#ifdef DEBUG
	NSLog(@"Game: connection request from peer %@", peerID);
#endif
    
	[session denyConnectionFromPeer:peerID];
}

- (void)session:(GKSession *)session connectionWithPeerFailed:(NSString *)peerID withError:(NSError *)error
{
#ifdef DEBUG
	NSLog(@"Game: connection with peer %@ failed %@", peerID, error);
#endif
    
	// Not used.
}

- (void)session:(GKSession *)session didFailWithError:(NSError *)error
{
#ifdef DEBUG
	NSLog(@"Game: session failed %@", error);
#endif
    
	if ([[error domain] isEqualToString:GKSessionErrorDomain])
	{
		if (_state != GameStateQuitting)
		{
			[self quitGameWithReason:QuitReasonConnectionDropped];
		}
	}
}

#pragma mark - GKSession Data Receive Handler

- (void)receiveData:(NSData *)data fromPeer:(NSString *)peerID inSession:(GKSession *)session context:(void *)context
{
#ifdef DEBUG
	NSLog(@"Game: receive data from peer: %@, data: %@, length: %d", peerID, data, [data length]);
#endif
    
	Packet *packet = [Packet packetWithData:data];
	if (packet == nil)
	{
		NSLog(@"Invalid packet: %@", data);
		return;
	}
    
	Player *player = [self playerWithPeerID:peerID];
	if (player != nil)
	{
		if (packet.packetNumber != -1 && packet.packetNumber <= player.lastPacketNumberReceived)
		{
			NSLog(@"Out-of-order packet!");
			return;
		}
        
		player.lastPacketNumberReceived = packet.packetNumber;
		player.receivedResponse = YES;
	}
    
	if (self.isServer)
		[self serverReceivedPacket:packet fromPlayer:player];
	else
		[self clientReceivedPacket:packet];
}

#pragma mark hans server delegate
- (void)serverReceivedPacket:(Packet *)packet fromPlayer:(Player *)player
{
	switch (packet.packetType)
	{
		case PacketTypeSignInResponse:
			if (_state == GameStateWaitingForSignIn)
			{
				if ([self receivedResponsesFromAllPlayers])
				{
					_state = GameStateWaitingForReady;
                    
					Packet *packet = [PacketServerReady packetWithPlayers:_players];
					[self sendPacketToAllClients:packet];
				}
			}
			break;
            
		case PacketTypeClientReady:
			if (_state == GameStateWaitingForReady && [self receivedResponsesFromAllPlayers])
			{
				//[self beginGame];
                NSLog(@"-----client ready-----");
                isBluetooth = YES;
			}
			break;
            
		case PacketTypeClientQuit:
			[self clientDidDisconnect:player.peerID redistributedCards:nil];
            isBluetooth = NO;
			break;
            
		default:
			NSLog(@"Server received unexpected packet: %@", packet);
			break;
	}
}



- (void) homeScoreServerChange:(int) nScoreIndex
{
    NSString* strScoreNum = [NSString stringWithFormat:@"%d", nScoreIndex];
    
    Packet *packet = [PacketLeftIncrease packetWithLeftScore:strScoreNum]; //score submit...
    [self sendPacketToAllClients:packet];
}

- (void) guestScoreServerChange:(int) nScoreIndex
{
    NSString* strScoreNum = [NSString stringWithFormat:@"%d", nScoreIndex];
    
    Packet *packet = [PacketRightIncrease packetWithRightScore:strScoreNum]; //score submit...
    [self sendPacketToAllClients:packet];
}

- (void) changeScoreBoard:(int) nBoardIndex
{
    NSString* strBoarNum = [NSString stringWithFormat:@"%d", nBoardIndex];
    
    Packet *packet = [PacketChangedBorderIndex packetWithBorderIndex:strBoarNum];
    [self sendPacketToAllClients:packet];
    
}

- (void) leftSwipeServer:(int) nBoardIndex
{
    NSString* strBoarNum = [NSString stringWithFormat:@"%d", nBoardIndex];
    
    Packet *packet = [PacketLeftSwipe packetWithBorderIndex:strBoarNum];
    [self sendPacketToAllClients:packet];
}

- (void) rightSwipeServer:(int) nBoardIndex
{
    NSString* strBoarNum = [NSString stringWithFormat:@"%d", nBoardIndex];
    
    Packet *packet = [PacketRightSwipe packetWithBorderIndex:strBoarNum];
    [self sendPacketToAllClients:packet];
}

- (void) rightLabelNameChangeServer:(NSString *) nLabelName
{
    Packet *packet = [PacketTypeRightLabelName packetWithName:nLabelName];
    [self sendPacketToAllClients:packet];
}

- (void) leftLabelNameChangeServer:(NSString *) nLabelName
{
    Packet *packet = [PacketTypeLeftLabelName packetWithName:nLabelName];
    [self sendPacketToAllClients:packet];
}

- (void) periodNumberChangeServer:(int) nPeriodNumber
{
    NSString* strBoarNum = [NSString stringWithFormat:@"%d", nPeriodNumber];
    Packet *packet = [PacketTypePeriodNumber packetWithNumber:strBoarNum];
    [self sendPacketToAllClients:packet];
}

- (void) timeChangeServer:(NSString *) nTime
{
    Packet *packet = [PacketTypeTimerLabels packetWithTime:nTime];
    [self sendPacketToAllClients:packet];
}

- (void) time2ChangeServer:(NSString *) nTime
{
    Packet *packet = [PacketTypeTimer2Labels packetWithTime:nTime];
    [self sendPacketToAllClients:packet];
}

#pragma mark client delegate
- (void)clientReceivedPacket:(Packet *)packet
{
	switch (packet.packetType)
	{
		case PacketTypeSignInRequest:
            NSLog(@"-----------------client received signin request packet-----------------------");
			if (_state == GameStateWaitingForSignIn)
			{
				_state = GameStateWaitingForReady;
                
				Packet *packet = [PacketSignInResponse packetWithPlayerName:_localPlayerName];
				[self sendPacketToServer:packet];
			}
			break;
            
		case PacketTypeServerReady:
			if (_state == GameStateWaitingForReady)
			{
				_players = ((PacketServerReady *)packet).players;
                
				Packet *packet = [Packet packetWithType:PacketTypeClientReady];
				[self sendPacketToServer:packet];
                
				//[self beginGame];
                isBluetooth = YES;
                
			}
			break;
            
		case PacketTypeOtherClientQuit:
			if (_state != GameStateQuitting)
			{
                PacketOtherClientQuit *quitPacket = ((PacketOtherClientQuit *)packet);
				[self clientDidDisconnect:quitPacket.peerID redistributedCards:quitPacket.cards];
                NSLog(@"---other client quit from the game---");
                //                isBluetooth = NO;
			}
			break;
            
		case PacketTypeServerQuit:
			[self quitGameWithReason:QuitReasonServerQuit];
            isBluetooth = NO;
			break;
            
        case PacketTypeLeftIncrease:
            [self HomeScore:(PacketLeftIncrease *)packet];
            break;
            
        case PacketTypeRightIncrease:
            [self GuestScore:(PacketRightIncrease *)packet];
            
            break;
            
        case PacketChangeBorderIndex:
            [self ScoreBoard:(PacketChangedBorderIndex *)packet];
            
            break;
            
        case PacketTypeLeftLabelNameChange:
            [self LeftLabelNameChange: (PacketTypeLeftLabelName *) packet];
            
            break;
            
        case PacketTypeRightLabelNameChange:
            [self RightLabelNameChange:(PacketTypeRightLabelName *)packet];
            
            break;
            
        case PacketTypeTimerLabelsChange:
            [self TimerLabelChange:(PacketTypeTimerLabels *)packet];
            
            break;
            
        case PacketTypeTimer2LabelsChange:
            [self Timer2LabelChange:(PacketTypeTimer2Labels *)packet];
            
            break;
            
        case PacketTypePeriodNumberChange:
            [self PeriodNumberChange:(PacketTypePeriodNumber *)packet];
            
            break;
            
        case PacketLeftSwipeChange:
            [self LeftSwipe:(PacketLeftSwipe *)packet];
            
            break;
            
        case PacketRightSwipeChange:
            [self RightSwipe:(PacketRightSwipe *)packet];
            
            break;
            
		default:
			NSLog(@"Client received unexpected packet: %@", packet);
			break;
	}
}

- (void) HomeScore:(PacketLeftIncrease *) packet
{
    NSString *score = packet.score;
    [self.delegate clientHomeScoreIncreased :score];
    
}

- (void) GuestScore:(PacketRightIncrease *) packet
{
    NSString *score = packet.score;
    [self.delegate clientGuestScoreIncreased :score];
    
}

- (void) ScoreBoard:(PacketChangedBorderIndex *) packet
{
    NSString *index = packet.indexNumber;
    [self.delegate clientBoardIndexChanged:index];
    
}

- (void) LeftSwipe:(PacketLeftSwipe *) packet
{
    NSString *index = packet.indexNumber;
    [self.delegate clientBoardLeftSwiped:index];
    
}

- (void) RightSwipe:(PacketRightSwipe *) packet
{
    NSString *index = packet.indexNumber;
    [self.delegate clientBoardRightSwiped:index];
    
}

- (void) LeftLabelNameChange:(PacketTypeLeftLabelName*) packet
{
    NSString *name = packet.name;
    [self.delegate clientBoardLeftLabelName:name];
    
}

- (void) RightLabelNameChange:(PacketTypeRightLabelName*) packet
{
    NSString *index = packet.name;
    [self.delegate clientBoardRightLabelName:index];
    
}

- (void) PeriodNumberChange:(PacketTypePeriodNumber*) packet
{
    NSString *index = packet.periodNumber;
    [self.delegate clientBoardPeriod:index];
    
}

- (void) TimerLabelChange:(PacketTypeTimerLabels*) packet
{
    NSString *index = packet.time;
    [self.delegate clientTimeSetting:index];
    
}

- (void) Timer2LabelChange:(PacketTypeTimer2Labels*) packet
{
    NSString *index = packet.time;
    [self.delegate clientTime2Setting:index];
    
}

@end
