//
//  GW2EventManager.h
//  EventTracker
//
//  Created by Maria Saveleva on 12/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GW2Map;
@class GW2EventList;
@class GW2EventNameList;

@interface GW2EventManager : NSObject

+ (instancetype)sharedManager;

- (void)recieveEventListFromManagerForMap:(GW2Map *)map withCompletion:(void (^)(GW2EventList *eventList))completionHandler;
- (void)recieveEventNameListFromManager:(void (^)(GW2EventNameList *eventNameList))completionHandler;

@end
