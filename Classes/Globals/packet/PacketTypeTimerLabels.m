//
//  PacketTypeTimerLabels.m
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "PacketTypeTimerLabels.h"
#import "NSData+SnapAdditions.h"

@implementation PacketTypeTimerLabels

@synthesize time = _time;

+ (id) packetWithTime:(NSString *)time
{
	return [[[self class] alloc] initWithName: time];
}

- (id)initWithName:(NSString *) time
{
	if ((self = [super initWithType:PacketTypeTimerLabelsChange]))
	{
		self.time = time;
	}
	return self;
}

+ (id)packetWithData:(NSData *)data
{
	size_t count;
	NSString *iNumber = [data rw_stringAtOffset:PACKET_HEADER_SIZE bytesRead:&count];
	return [[self class] packetWithTime:iNumber];
}

- (void)addPayloadToData:(NSMutableData *)data
{
	[data rw_appendString:self.time];
}


@end
