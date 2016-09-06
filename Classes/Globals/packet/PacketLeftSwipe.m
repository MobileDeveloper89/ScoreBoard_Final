//
//  PacketLeftSwipe.m
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "NSData+SnapAdditions.h"
#import "PacketLeftSwipe.h"

@implementation PacketLeftSwipe

@synthesize indexNumber = _indexNumber;

+ (id) packetWithBorderIndex:(NSString *) indexNumber
{
	return [[[self class] alloc] initWithIndexNumber:indexNumber];
}

- (id)initWithIndexNumber:(NSString *)indexNumber
{
	if ((self = [super initWithType:PacketLeftSwipeChange]))
	{
		self.indexNumber = indexNumber;
	}
	return self;
}

+ (id) packetWithData:(NSData *)data
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



