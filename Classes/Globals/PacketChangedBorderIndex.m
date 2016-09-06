//
//  PacketChangedBorderIndex.m
//  Scoreboard
//
//  Created by Lion on 5/10/14.
//
//
#import "NSData+SnapAdditions.h"
#import "PacketChangedBorderIndex.h"

@implementation PacketChangedBorderIndex

@synthesize indexNumber = _indexNumber;

+ (id)packetWithBorderIndex:(NSString *)indexNumber
{
	return [[[self class] alloc] initWithIndexNumber:indexNumber];
}

- (id)initWithIndexNumber:(NSString *)indexNumber
{
	if ((self = [super initWithType:PacketChangeBorderIndex]))
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
