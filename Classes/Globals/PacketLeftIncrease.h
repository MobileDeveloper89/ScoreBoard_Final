//
//  PacketLeftIncrease.h
//  Scoreboard
//
//  Created by Lion on 5/10/14.
//
//

#import "Packet.h"

@interface PacketLeftIncrease : Packet

@property (nonatomic, copy) NSString *score;

+ (id)packetWithLeftScore:(NSString *)score;

@end
