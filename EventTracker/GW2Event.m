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
             @"eventID": @"event_id",
             @"mapID": @"map_id",
             @"eventState": @"state",
             @"worldID": @"world_id",
             };
}

+ (NSValueTransformer *)worldIDJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        return [formatter numberFromString:stringFromJSON];
    }];
}

+ (NSValueTransformer *)mapIDJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        NSNumberFormatter *formatter = [NSNumberFormatter new];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        return [formatter numberFromString:stringFromJSON];
    }];
}

+ (NSValueTransformer *)eventIDJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithBlock:^(NSString *stringFromJSON){
        return stringFromJSON;
    }];
}

+ (NSValueTransformer *)eventStateJSONTransformer
{
    return [MTLValueTransformer mtl_valueMappingTransformerWithDictionary:@{@"Inactive": @(GW2EventStatusInactive),
                                                                            @"Active" : @(GW2EventStatusActive),
                                                                            @"Success" : @(GW2EventStatusSuccess),
                                                                            @"Fail" : @(GW2EventStatusFail),
                                                                            @"Warmup" : @(GW2EventStatusWarmup),
                                                                            @"Preparation" : @(GW2EventStatusPreparation)}];
}

@end
