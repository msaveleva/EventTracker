//
//  GW2Server.m
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2Server.h"

@implementation GW2Server

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"serverID": @"id",
             @"serverName": @"name",
             };
}

+ (NSValueTransformer *)serverIDJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        return [formatter numberFromString:stringFromJSON];
    }];
}

+ (NSValueTransformer *)serverNameJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        return stringFromJSON;
    }];
}

@end
