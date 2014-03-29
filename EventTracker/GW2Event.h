//
//  GW2Event.h
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface GW2Event : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *eventID;
@property (copy, nonatomic) NSString *eventName;

@end
