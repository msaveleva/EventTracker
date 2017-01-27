//
//  GW2UserSettings.h
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GW2Server;

@interface GW2UserSettings : NSObject

@property (strong, nonatomic) NSNumber *userServerID;
@property (strong, nonatomic) NSDictionary *userEventIDandName;

+ (instancetype)sharedSettings;

- (NSNumber *)loadServerID;
- (NSArray *)loadUserEventIDandName;

@end
