//
//  PacketLeftIncrease.m
//  Scoreboard
//
//  Created by Lion on 5/10/14.
//
//
#import "NSData+SnapAdditions.h"
#import "PacketLeftIncrease.h"

@implementation PacketLeftIncrease

@synthesize score = _score;

+ (id)packetWithLeftScore:(NSString *)score
{
	return [[[self class] alloc] initWithScore :score];
}

- (id)initWithScore:(NSString *)score
{
	if ((self = [super initWithType:PacketTypeLeftIncrease]))
	{
		self.score = score;
	}
	return self;
}

+ (id)packetWithData:(NSData *)data
{
	size_t count;
	NSString *score = [data rw_stringAtOffset:PACKET_HEADER_SIZE bytesRead:&count];
	return [[self class] packetWithLeftScore:score];
}

- (void)addPayloadToData:(NSMutableData *)data
{
	[data rw_appendString:self.score];
}

@end
