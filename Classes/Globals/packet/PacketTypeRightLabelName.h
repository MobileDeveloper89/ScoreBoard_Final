//
//  PacketTypeRightLabelName.h
//  Scoreboard
//
//  Created by WangLong on 6/7/14.
//
//

#import "Packet.h"

@interface PacketTypeRightLabelName : Packet

@property (nonatomic, copy) NSString *name;

+ (id)packetWithName:(NSString *) name;

@end
