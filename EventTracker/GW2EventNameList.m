//
//  GW2EventNameList.m
//  EventTracker
//
//  Created by Maria Saveleva on 06/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2EventNameList.h"
#import "GW2EventName.h"

@implementation GW2EventNameList

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"eventNameList": @"eventNameList"};
}

+ (NSValueTransformer *)eventNameListJSONTransformer
{
    return [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:[GW2EventName class]];
}

@end
