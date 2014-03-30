//
//  GW2Protocol.h
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GW2Protocol <NSObject>

@required
- (void)recievedJSONData:(NSData *)data;

@end
