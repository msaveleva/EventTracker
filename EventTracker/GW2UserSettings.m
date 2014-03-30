//
//  GW2UserSettings.m
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2UserSettings.h"

@interface GW2UserSettings ()

@end

@implementation GW2UserSettings

+ (instancetype)sharedSettings
{
    static GW2UserSettings *userSettings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userSettings = [[self alloc] init];
    });
    
    return userSettings;
}

- (void)setUserServerID:(NSNumber *)userServerID
{
    _userServerID = userServerID;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userServerID forKey:@"userKey"];
    
    [defaults synchronize];
}

- (NSNumber *)loadServerID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *serverID = [defaults objectForKey:@"userKey"];
    
    return serverID;
}

@end
