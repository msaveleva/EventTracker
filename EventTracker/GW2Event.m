//
//  GW2Event.m
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2Event.h"

@implementation GW2Event

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"worldID": @"world_id",
             @"mapID": @"map_id",
             @"eventID": @"event_id",
             @"eventState": @"eventState",
             };
}

@end
