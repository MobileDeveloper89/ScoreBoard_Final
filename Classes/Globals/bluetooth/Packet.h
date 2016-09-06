
typedef enum
{
	PacketTypeSignInRequest = 0x64,    // server to client
	PacketTypeSignInResponse,          // client to server

	PacketTypeServerReady,             // server to client
	PacketTypeClientReady,
    
    PacketTypeOtherClientQuit,
    PacketTypeServerQuit,              // server to client
    PacketTypeClientQuit,
//////////////////////////////////////
	PacketTypeLeftIncrease,
    PacketTypeRightIncrease,
    
    PacketChangeBorderIndex,
    
    PacketLeftSwipeChange,
    PacketRightSwipeChange,
    
    PacketTypeLeftLabelNameChange,
    PacketTypeRightLabelNameChange,
    
    PacketTypeTimerLabelsChange,
    PacketTypeTimer2LabelsChange,
    
    PacketTypePeriodNumberChange,
    
    
    
//////////////////////////////////////////
    PacketTypeDealCards,               // server to client
	PacketTypeClientDealtCards,        // client to server
    
	PacketTypeActivatePlayer,          // server to client
	PacketTypeClientTurnedCard,        // client to server
	
	PacketTypePlayerShouldSnap,        // client to server
	PacketTypePlayerCalledSnap,        // server to client

}
PacketType;

const size_t PACKET_HEADER_SIZE;

@interface Packet : NSObject

@property (nonatomic, assign) int packetNumber;
@property (nonatomic, assign) PacketType packetType;
@property (nonatomic, assign) BOOL sendReliably;

+ (id)packetWithType:(PacketType)packetType;
- (id)initWithType:(PacketType)packetType;

+ (id)packetWithData:(NSData *)data;

- (NSData *)data;

+ (NSDictionary *)cardsFromData:(NSData *)data atOffset:(size_t) offset;
- (void)addCards:(NSDictionary *)cards toPayload:(NSMutableData *)data;

@end
