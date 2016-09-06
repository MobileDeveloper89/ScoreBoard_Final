
#import "Packet.h"
//#import "Card.h"
#import "PacketOtherClientQuit.h"
#import "PacketServerReady.h"
#import "PacketSignInResponse.h"
#import "NSData+SnapAdditions.h"

#import "PacketLeftIncrease.h"
#import "PacketRightIncrease.h"
#import "PacketChangedBorderIndex.h"

#import "PacketLeftSwipe.h"
#import "PacketRightSwipe.h"
#import "PacketTypeLeftLabelName.h"
#import "PacketTypeRightLabelName.h"

#import "PacketTypePeriodNumber.h"
#import "PacketTypeTimerLabels.h"
#import "PacketTypeTimer2Labels.h"


const size_t PACKET_HEADER_SIZE = 10;

@implementation Packet

@synthesize packetNumber = _packetNumber;
@synthesize packetType = _packetType;
@synthesize sendReliably = _sendReliably;

+ (id)packetWithType:(PacketType)packetType
{
	return [[[self class] alloc] initWithType:packetType];
}

- (id)initWithType:(PacketType)packetType
{
	if ((self = [super init]))
	{
		self.packetNumber = -1;
		self.packetType = packetType;
		self.sendReliably = YES;
	}
	return self;
}

+ (id)packetWithData:(NSData *)data
{
	if ([data length] < PACKET_HEADER_SIZE)
	{
		NSLog(@"Error: Packet too small");
		return nil;
	}
    
	if ([data rw_int32AtOffset:0] != 'SNAP')
	{
		NSLog(@"Error: Packet has invalid header");
		return nil;
	}
    
	int packetNumber = [data rw_int32AtOffset:4];
	PacketType packetType = [data rw_int16AtOffset:8];
    
	Packet *packet;
    
	switch (packetType)
	{
        case PacketTypeSignInRequest:
            //            break;
		case PacketTypeClientReady:
            //            break;
            
        case PacketTypeServerQuit:
//			packet = [Packet packetWithType:packetType];
//			break;
            
		case PacketTypeClientQuit:
			packet = [Packet packetWithType:packetType];
			break;
            
		case PacketTypeSignInResponse:
			packet = [PacketSignInResponse packetWithData:data];
			break;
            
		case PacketTypeServerReady:
			packet = [PacketServerReady packetWithData:data];
			break;
            
#pragma mark hans packets
        case PacketTypeLeftIncrease:
            packet = [PacketLeftIncrease packetWithData:data];
			break;
        case PacketTypeRightIncrease:
            packet = [PacketRightIncrease packetWithData:data];
			break;
        case PacketChangeBorderIndex:
            packet = [PacketChangedBorderIndex packetWithData:data];
			break;
        case PacketLeftSwipeChange:
            packet = [PacketLeftSwipe packetWithData:data];
			break;
        case PacketRightSwipeChange:
            packet = [PacketRightSwipe packetWithData:data];
			break;
        case PacketTypeLeftLabelNameChange:
            packet = [PacketTypeLeftLabelName packetWithData:data];
			break;
        case PacketTypeRightLabelNameChange:
            packet = [PacketTypeRightLabelName packetWithData:data];
			break;
        case PacketTypePeriodNumberChange:
            packet = [PacketTypePeriodNumber packetWithData:data];
			break;
        case PacketTypeTimerLabelsChange:
            packet = [PacketTypeTimerLabels packetWithData:data];
			break;
        case PacketTypeTimer2LabelsChange:
            packet = [PacketTypeTimer2Labels packetWithData:data];
			break;
            
            
		case PacketTypeOtherClientQuit:
			packet = [PacketOtherClientQuit packetWithData:data];
			break;
		default:
			NSLog(@"Error: Packet has invalid type");
			return nil;
	}
    
	packet.packetNumber = packetNumber;
	return packet;
}

- (NSData *)data
{
	NSMutableData *data = [[NSMutableData alloc] initWithCapacity:100];
    
	[data rw_appendInt32:'SNAP'];   // 0x534E4150
	[data rw_appendInt32:self.packetNumber];
	[data rw_appendInt16:self.packetType];
    
	[self addPayloadToData:data];
	return data;
}

- (void)addPayloadToData:(NSMutableData *)data
{
	// base class does nothing
}

- (void)addCards:(NSMutableDictionary *)cards toPayload:(NSMutableData *)data
{
	[cards enumerateKeysAndObjectsUsingBlock:^(id key, NSArray *array, BOOL *stop)
     {
         [data rw_appendString:key];
         [data rw_appendInt8:[array count]];
         
         for (int t = 0; t < [array count]; ++t)
         {
             //			Card *card = [array objectAtIndex:t];
             //			[data rw_appendInt8:card.suit];
             //			[data rw_appendInt8:card.value];
         }
     }];
}

+ (NSMutableDictionary *)cardsFromData:(NSData *)data atOffset:(size_t) offset
{
	size_t count;
    
	NSMutableDictionary *cards = [NSMutableDictionary dictionaryWithCapacity:4];
    
	while (offset < [data length])
	{
		NSString *peerID = [data rw_stringAtOffset:offset bytesRead:&count];
		offset += count;
        
		int numberOfCards = [data rw_int8AtOffset:offset];
		offset += 1;
        
		NSMutableArray *array = [NSMutableArray arrayWithCapacity:numberOfCards];
        
		for (int t = 0; t < numberOfCards; ++t)
		{
			int suit = [data rw_int8AtOffset:offset];
			offset += 1;
            
			int value = [data rw_int8AtOffset:offset];
			offset += 1;
			
            //			Card *card = [[Card alloc] initWithSuit:suit value:value];
            //			[array addObject:card];
		}
        
		[cards setObject:array forKey:peerID];
	}
    
	return cards;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%@ number=%d, type=%d", [super description], self.packetNumber, self.packetType];
}

@end
