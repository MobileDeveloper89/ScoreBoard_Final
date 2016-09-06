//
//  PacketTypePeriodNumber.m
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "PacketTypePeriodNumber.h"
#import "NSData+SnapAdditions.h"

@implementation PacketTypePeriodNumber

@synthesize periodNumber = _periodNumber;

+ (id) packetWithNumber:(NSString *)periodNumber
{
	return [[[self class] alloc] initWithName:periodNumber];
}

- (id)initWithName:(NSString *) periodNumber
{
	if ((self = [super initWithType:PacketTypePeriodNumberChange]))
	{
		self.periodNumber = periodNumber;
	}
	return self;
}

+ (id)packetWithData:(NSData *)data
{
	size_t count;
	NSString *iNumber = [data rw_stringAtOffset:PACKET_HEADER_SIZE bytesRead:&count];
	return [[self class] packetWithNumber:iNumber];
}

- (void)addPayloadToData:(NSMutableData *)data
{
	[data rw_appendString:self.periodNumber];
}


@end
