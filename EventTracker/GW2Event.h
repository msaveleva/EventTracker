//
//  GW2Event.h
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

typedef NS_ENUM(NSUInteger, GW2EventStatus) {
    GW2EventStatusInactive = 0, //The event is not running.
    GW2EventStatusActive, //The event is running now.
    GW2EventStatusSuccess, //The event has succeeded.
    GW2EventStatusFail, //The event has failed.
    GW2EventStatusWarmup, //The event is inactive and waiting for certain criteria to be met before becoming Active.
    GW2EventStatusPreparation, //The criteria for the event to start have been met, but certain activities (such as an NPC dialogue) have not completed yet. After the activites have been completed, the event will become Active.
};

@interface GW2Event : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *worldID;
@property (strong, nonatomic) NSNumber *mapID;
@property (strong, nonatomic) NSString *eventID;
@property (nonatomic) NSUInteger eventState;

@end
