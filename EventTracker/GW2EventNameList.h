//
//  GW2EventNameList.h
//  EventTracker
//
//  Created by Maria Saveleva on 06/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface GW2EventNameList : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSArray *eventNameList;

@end
