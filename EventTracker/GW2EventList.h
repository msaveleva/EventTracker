//
//  GW2EventList.h
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@class GW2Event;

@interface GW2EventList : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSArray *eventList;

@end
