//
//  GW2Client.h
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GW2Protocol.h"

@interface GW2Client : NSObject

@property (weak, nonatomic) id<GW2Protocol>delegate;

+ (instancetype)sharedInstance;

- (void)fetchServerList;

@end
