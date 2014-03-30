//
//  GW2Client.m
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2Client.h"
#import "GW2ServerList.h"
#import "GW2MapList.h"

static NSString * const serverListURL = @"https://api.guildwars2.com/v1/world_names.json?lang=en";
static NSString * const mapListURL = @"https://api.guildwars2.com/v1/map_names.json?lang=en";

@implementation GW2Client

- (void)fetchSeverListWithCompletionHandler:(void (^)(NSData *recievedData))completionHandler
{
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:[NSURL URLWithString:serverListURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error){
                dispatch_sync(dispatch_get_main_queue(), ^{
                    completionHandler(data);
                });
            }] resume];
}

- (void)fetchMapListWithCompletionHandler:(void (^)(NSData *))completionHandler
{
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:[NSURL URLWithString:mapListURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error){
                dispatch_sync(dispatch_get_main_queue(), ^{
                    completionHandler(data);
                });
            }] resume];
}

@end
