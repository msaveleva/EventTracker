//
//  GW2EventManager.m
//  EventTracker
//
//  Created by Maria Saveleva on 12/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2EventManager.h"
#import "GW2Client.h"
#import "GW2Event.h"
#import "GW2EventList.h"
#import "GW2EventName.h"
#import "GW2EventNameList.h"

@implementation GW2EventManager

+ (instancetype)sharedSettings
{
    static GW2EventManager *eventManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        eventManager = [[self alloc] init];
    });
    
    return eventManager;
}

#pragma mark - Event Arrays

@end
