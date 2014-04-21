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

@property (strong, nonatomic) NSMutableArray *userFavoriteEvents;

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

- (void)setUserEventIDandName:(NSDictionary *)userEventIDandName
{
    _userFavoriteEvents = [NSMutableArray arrayWithArray:[self loadUserEventIDandName]];
    
    for (NSDictionary *eventIDandName in _userFavoriteEvents) {
        NSString *arrayEventID = [eventIDandName objectForKey:@"eventID"];
        NSString *userEventID = [userEventIDandName objectForKey:@"eventID"];
        if ([arrayEventID isEqualToString:userEventID]) {
            return;
        }
    }
    
    [_userFavoriteEvents addObject:userEventIDandName];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:(NSArray *)_userFavoriteEvents forKey:kUserFavoriteEventIDs];
    
    [defaults synchronize];
}
- (void)removeFromFavoritesEventWithID:(NSString *)eventID
{
    self.userFavoriteEvents = [NSMutableArray arrayWithArray:[self loadUserEventIDandName]];
    
    for (NSDictionary *eventIDandName in _userFavoriteEvents) {
        NSString *arrayEventID = [eventIDandName objectForKey:@"eventID"];
        if ([eventID isEqualToString:arrayEventID]) {
            [self.userFavoriteEvents removeObject:eventIDandName];
        }
    }
}

- (NSArray *)loadUserEventIDandName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *favoritEvents = [defaults objectForKey:kUserFavoriteEventIDs];
    
    return favoritEvents;
}

@end
