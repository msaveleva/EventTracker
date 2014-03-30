//
//  GW2Client.m
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2Client.h"
#import "GW2ServerList.h"

static NSString *serverListURL = @"https://api.guildwars2.com/v1/world_names.json?lang=en";

@implementation GW2Client

+ (instancetype)sharedInstance
{
    static GW2Client *client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[self alloc] init];
    });
    
    return client;
}

- (void)fetchServerList
{
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:serverListURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error){
                if (self.delegate) {
                    [self.delegate recievedJSONData:data];
                }
    }] resume];
}

@end
