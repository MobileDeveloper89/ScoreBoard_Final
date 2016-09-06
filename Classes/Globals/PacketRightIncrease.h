//
//  PacketRightIncrease.h
//  Scoreboard
//
//  Created by Lion on 5/10/14.
//
//

#import "Packet.h"

@interface PacketRightIncrease : Packet

@property (nonatomic, copy) NSString *score;

+ (id)packetWithRightScore:(NSString *)score;

@end
