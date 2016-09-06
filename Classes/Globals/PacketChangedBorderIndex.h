//
//  PacketChangedBorderIndex.h
//  Scoreboard
//
//  Created by Lion on 5/10/14.
//
//

#import "Packet.h"

@interface PacketChangedBorderIndex : Packet
@property (nonatomic, copy) NSString *indexNumber;

+ (id)packetWithBorderIndex:(NSString *)indexNumber;

@end
