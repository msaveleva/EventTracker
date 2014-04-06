//
//  GW2MapList.h
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface GW2MapList : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSArray *mapList;

@end
