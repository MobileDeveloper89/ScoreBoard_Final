//
//  PacketTypeLeftLabelName.m
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "PacketTypeLeftLabelName.h"
#import "NSData+SnapAdditions.h"

@implementation PacketTypeLeftLabelName

@synthesize name = _name;

+ (id) packetWithName:(NSString *)name
{
	return [[[self class] alloc] initWithName:name];
}

- (id)initWithName:(NSString *)name
{
	if ((self = [super initWithType:PacketTypeLeftLabelNameChange]))
	{
		self.name = name;
	}
	return self;
}

+ (id)packetWithData:(NSData *)data
{
	size_t count;
	NSString *iNumber = [data rw_stringAtOffset:PACKET_HEADER_SIZE bytesRead:&count];
	return [[self class] packetWithName:iNumber];
}

- (void)addPayloadToData:(NSMutableData *)data
{
	[data rw_appendString:self.name];
}

@end



