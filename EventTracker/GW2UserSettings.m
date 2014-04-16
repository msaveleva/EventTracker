//
//  GW2UserSettings.m
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2UserSettings.h"

static NSString * const kUserKey = @"userKey";
static NSString * const kUserFavoriteEventIDs = @"userFavoriteEventIDs";

@interface GW2UserSettings ()

@property (strong, nonatomic) NSMutableArray *userFavoriteEventIDs;

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
    [defaults setObject:userServerID forKey:kUserKey];
    
    [defaults synchronize];
}

- (NSNumber *)loadServerID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *serverID = [defaults objectForKey:kUserKey];
    
    return serverID;
}

- (void)setUserEventID:(NSMutableArray *)userEventID
{    
    _userFavoriteEventIDs = [NSMutableArray arrayWithArray:[self loadUserFavoriteEventIDs]];
    
    [_userFavoriteEventIDs addObject:userEventID];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:(NSArray *)_userFavoriteEventIDs forKey:kUserFavoriteEventIDs];
    
    [defaults synchronize];
}

- (NSArray *)loadUserFavoriteEventIDs
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *favoritEvents = [defaults objectForKey:kUserFavoriteEventIDs];
    
    return favoritEvents;
}

@end
