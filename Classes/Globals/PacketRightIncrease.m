//
//  PacketRightIncrease.m
//  Scoreboard
//
//  Created by Lion on 5/10/14.
//
//

#import "NSData+SnapAdditions.h"
#import "PacketRightIncrease.h"

@implementation PacketRightIncrease

@synthesize score = _score;

+ (id)packetWithRightScore:(NSString *)score
{
	return [[[self class] alloc] initWithScore :score];
}

- (id)initWithScore:(NSString *)score
{
	if ((self = [super initWithType:PacketTypeRightIncrease]))
	{
		self.score = score;
	}
	return self;
}

+ (id)packetWithData:(NSData *)data
{
	size_t count;
	NSString *score = [data rw_stringAtOffset:PACKET_HEADER_SIZE bytesRead:&count];
	return [[self class] packetWithRightScore:score];
}

- (void)addPayloadToData:(NSMutableData *)data
{
	[data rw_appendString:self.score];
}

@end
