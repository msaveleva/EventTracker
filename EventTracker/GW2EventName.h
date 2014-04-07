//
//  GW2EventName.h
//  EventTracker
//
//  Created by Maria Saveleva on 29/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface GW2EventName : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *eventID;
@property (copy, nonatomic) NSString *eventName;

@end
