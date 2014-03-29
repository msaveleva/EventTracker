//
//  GW2ServerList.m
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2ServerList.h"
#import "GW2Server.h"

@implementation GW2ServerList

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"serverID": @"serverList.serverID",
             @"serverName": @"serverList.serverName",
             };
}

+ (NSValueTransformer *)serverListJSONTransformer
{
    return [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:[GW2Server class]];
}

@end
