//
//  GW2Client.h
//  EventTracker
//
//  Created by Maria Saveleva on 30/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GW2Client : NSObject

- (void)fetchSeverListWithCompletionHandler:(void (^)(NSData *data))completionHandler;
- (void)fetchMapListWithCompletionHandler:(void (^)(NSData *data))completionHandler;

- (void)fetchEventListForServerWithID:(NSNumber *)serverID
                            mapWithID:(NSNumber *)mapID
                withCompletionHandler:(void (^)(NSData *data))completionHandler;

@end
