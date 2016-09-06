
#import "Player.h"

@implementation Player
@synthesize peerID = _peerID;
@synthesize receivedResponse = _receivedResponse;
@synthesize lastPacketNumberReceived = _lastPacketNumberReceived;


- (id)init
{
	if ((self = [super init]))
	{
		_lastPacketNumberReceived = -1;
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

@end
