
//
//  GW2MapList.m
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2MapList.h"
#import "GW2Map.h"

@implementation GW2MapList

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"mapList": @"mapList"};
}

+ (NSValueTransformer *)mapListJSONTransformer
{
    return [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:[GW2Map class]];
}

@end
