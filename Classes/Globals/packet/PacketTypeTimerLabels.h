//
//  PacketTypeTimerLabels.h
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "Packet.h"

@interface PacketTypeTimerLabels : Packet

@property (nonatomic, copy) NSString *time;

+ (id) packetWithTime:(NSString *)time;

@end
