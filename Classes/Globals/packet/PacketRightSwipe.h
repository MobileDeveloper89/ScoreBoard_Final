//
//  PacketRightSwipe.h
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "Packet.h"

@interface PacketRightSwipe : Packet

@property (nonatomic, copy) NSString *indexNumber;

+ (id)packetWithBorderIndex:(NSString *)indexNumber;

@end
