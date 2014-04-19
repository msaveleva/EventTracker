//
//  GW2EventManager.m
//  EventTracker
//
//  Created by Maria Saveleva on 12/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2EventManager.h"
#import "GW2Client.h"
#import "GW2Map.h"
#import "GW2Event.h"
#import "GW2EventList.h"
#import "GW2EventName.h"
#import "GW2EventNameList.h"
#import "GW2UserSettings.h"

@interface GW2EventManager ()

@property (strong, nonatomic) GW2EventList *eventListFromManager;
@property (strong, nonatomic) GW2EventNameList *eventNameListFromManager;
@property (strong, nonatomic) GW2Event *eventDetails;

@end

@implementation GW2EventManager

+ (instancetype)sharedManager
{
    static GW2EventManager *eventManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        eventManager = [[self alloc] init];
    });
    
    return eventManager;
}

#pragma mark - Event Arrays

- (void)recieveEventListFromManagerForMap:(GW2Map *)map withCompletion:(void (^)(GW2EventList *eventList))completionHandler
{
    GW2Client *client = [[GW2Client alloc] init];
    NSNumber *serverID = [[GW2UserSettings sharedSettings] loadServerID];
    __weak typeof(self) weakself = self;
    [client fetchEventListForServerWithID:serverID
                                mapWithID:map.mapID
                    withCompletionHandler:^(NSData* recievedData){
                        NSDictionary *jSONDict = [NSJSONSerialization JSONObjectWithData:recievedData
                                                                                 options:0
                                                                                   error:NULL];
                        weakself.eventListFromManager = [MTLJSONAdapter modelOfClass:[GW2EventList class]
                                                                  fromJSONDictionary:jSONDict
                                                                               error:NULL];
                        
                        completionHandler(weakself.eventListFromManager);
                    }];
}

- (void)recieveEventNameListFromManager:(void (^)(GW2EventNameList *eventNameList))completionHandler
{
    GW2Client *client = [[GW2Client alloc] init];
    __weak typeof(self) weakself = self;
    [client fetchEventNameListWithCompletionHandler:^(NSData *recievedData){
        NSArray *jSONArray = [NSJSONSerialization JSONObjectWithData:recievedData
                                                             options:0
                                                               error:NULL];
        NSDictionary *jSONDict = @{@"eventNameList": jSONArray};
        weakself.eventNameListFromManager = [MTLJSONAdapter modelOfClass:[GW2EventNameList class]
                                                      fromJSONDictionary:jSONDict
                                                                   error:NULL];
        completionHandler(weakself.eventNameListFromManager);
    }];
}

- (void)recieveEventDetailsFromManagerForEventID:(NSString *)eventID withCompletion:(void (^)(GW2Event *eventDetails))completionHandler
{
    GW2Client *client = [[GW2Client alloc] init];
    NSNumber *serverID = [[GW2UserSettings sharedSettings] loadServerID];
    __weak typeof(self) weakself = self;
    [client fetchEventDetailsForServerWithID:serverID
                                     eventID:eventID
                       withCompletionHandler:^(NSData *recievedData){
        NSDictionary *jSONDict = [NSJSONSerialization JSONObjectWithData:recievedData
                                                                 options:0
                                                                   error:NULL];
        GW2EventList *events = [MTLJSONAdapter modelOfClass:[GW2EventList class] fromJSONDictionary:jSONDict error:NULL];
        weakself.eventDetails = [events.eventList firstObject];
        
        completionHandler(weakself.eventDetails);
    }];
}

@end
