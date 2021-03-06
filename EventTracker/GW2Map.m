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

+ (NSValueTransformer *)mapIDJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        return [formatter numberFromString:stringFromJSON];
    }];
}

+ (NSValueTransformer *)mapNameJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        return stringFromJSON;
    }];
}

@end
