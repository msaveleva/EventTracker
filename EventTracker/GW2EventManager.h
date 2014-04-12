//
//  GW2EventManager.h
//  EventTracker
//
//  Created by Maria Saveleva on 12/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GW2EventList;
@class GW2EventNameList;

@interface GW2EventManager : NSObject

@property (strong, nonatomic) GW2EventList *eventListFromManager;
@property (strong, nonatomic) GW2EventNameList *eventNameListFromManager;

+ (instancetype)sharedSettings;

@end
