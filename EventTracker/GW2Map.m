//
//  GW2Map.m
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2Map.h"

@implementation GW2Map

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"mapID": @"id",
             @"mapName": @"name",
             };
}

@end
