//
//  Game.h
//  Scoreboard
//
//  Created by Lion on 5/10/14.
//
//


#import "Player.h"

@class Game;

@protocol GameDelegate <NSObject>

- (void)gameWaitingForClientsReady:(Game *)game;  // server only
- (void)gameWaitingForServerReady:(Game *)game;   // clients only

- (void)gameDidBegin:(Game *)game;

- (void)game:(Game *)game playerDidDisconnect:(Player *)disconnectedPlayer redistributedCards:(NSDictionary *)redistributedCards;
- (void)game:(Game *)game didQuitWithReason:(QuitReason)reason;


#pragma mark hans game delegates
- (void)boardisServer:(BOOL) isServer;

- (void) clientHomeScoreIncreased:(NSString *) score;
- (void) clientGuestScoreIncreased:(NSString *) score;
- (void) clientBoardIndexChanged:(NSString *) index;

- (void) clientBoardLeftSwiped:(NSString *) index;
- (void) clientBoardRightSwiped: (NSString *) index;

- (void) clientTimeSetting:(NSString *) time;
- (void) clientTime2Setting:(NSString *) time;

- (void) clientBoardPeriod:(NSString *) period;
- (void) clientBoardLeftLabelName:(NSString *) name;
- (void) clientBoardRightLabelName:(NSString *) name;


@end

@interface Game : NSObject <GKSessionDelegate>

@property (nonatomic, retain) id <GameDelegate> delegate;
@property (nonatomic, assign) BOOL isServer;

- (void)startServerGameWithSession:(GKSession *)session playerName:(NSString *)name clients:(NSArray *)clients;
- (void)startClientGameWithSession:(GKSession *)session playerName:(NSString *)name server:(NSString *)peerID;

- (void)quitGameWithReason:(QuitReason)reason;

- (void)beginRound;

@end
