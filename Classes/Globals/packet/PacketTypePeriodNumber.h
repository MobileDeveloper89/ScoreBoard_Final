//
//  PacketTypePeriodNumber.h
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "Packet.h"

@interface PacketTypePeriodNumber : Packet

@property (nonatomic, copy) NSString *periodNumber;

+ (id)packetWithNumber:(NSString *) periodNumber;

@end
