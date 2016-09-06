//
//  PacketTypeTimer2Labels.h
//  Scoreboard
//
//  Created by WangLong on 6/8/14.
//
//

#import "Packet.h"

@interface PacketTypeTimer2Labels : Packet

@property (nonatomic, copy) NSString *time;

+ (id) packetWithTime:(NSString *)time;
@end
