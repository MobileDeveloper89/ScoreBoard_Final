//
//  PacketRightSwipe.m
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "PacketRightSwipe.h"
#import "NSData+SnapAdditions.h"

@implementation PacketRightSwipe

@synthesize indexNumber = _indexNumber;

+ (id) packetWithBorderIndex:(NSString *)indexNumber
{
	return [[[self class] alloc] initWithIndexNumber:indexNumber];
}

- (id)initWithIndexNumber:(NSString *)indexNumber
{
	if ((self = [super initWithType:PacketRightSwipeChange]))
	{
		self.indexNumber = indexNumber;
	}
	return self;
}

+ (id)packetWithData:(NSData *)data
{
	size_t count;
	NSString *iNumber = [data rw_stringAtOffset:PACKET_HEADER_SIZE bytesRead:&count];
	return [[self class] packetWithBorderIndex:iNumber];
}

- (void)addPayloadToData:(NSMutableData *)data
{
	[data rw_appendString:self.indexNumber];
}


@end


