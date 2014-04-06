//
//  GW2EventList.m
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2EventList.h"
#import "GW2Event.h"

@implementation GW2EventList

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"eventList": @"eventList"};
}

+ (NSValueTransformer *)serverListJSONTransformer
{
    return [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:[GW2Event class]];
}

@end
