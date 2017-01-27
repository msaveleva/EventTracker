//
//  GW2EventName.m
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2EventName.h"

@implementation GW2EventName

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"eventID": @"id",
             @"eventName": @"name",
             };
}

+ (NSValueTransformer *)eventIDJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        return stringFromJSON;
    }];
}

+ (NSValueTransformer *)eventNameJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        return stringFromJSON;
    }];
}

@end
