//
//  GW2EventsViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 27/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2EventsViewController.h"
#import "GW2UserSettings.h"
#import "GW2ServerListViewController.h"
#import "GW2Map.h"
#import "GW2Client.h"
#import "GW2Event.h"
#import "GW2EventList.h"
#import "GW2EventName.h"
#import "GW2EventNameList.h"

@interface GW2EventsViewController ()

@property (strong, nonatomic) GW2EventList *events;
@property (strong, nonatomic) GW2EventNameList *eventNames;
@property (strong, nonatomic) NSMutableArray *activeEvents;
@property (strong, nonatomic) NSMutableArray *activeEventNames;
@property (strong, nonatomic) GW2Client *client;

@end

@implementation GW2EventsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[GW2UserSettings sharedSettings] loadServerID] == nil) {
        GW2ServerListViewController *viewController =
            [self.storyboard instantiateViewControllerWithIdentifier:@"serverList"];
        [self presentViewController:viewController animated:NO completion:nil];
    }
    
    self.client = [GW2Client new];
    
    //fetching event name list
    __weak typeof(self) weakself = self;
    [self.client fetchEventNameListWithCompletionHandler:^(NSData *recievedData){
        NSArray *jSONArray = [NSJSONSerialization JSONObjectWithData:recievedData
                                                             options:0
                                                               error:NULL];
        NSDictionary *jSONDict = @{@"eventNameList": jSONArray};
        weakself.eventNames = [MTLJSONAdapter modelOfClass:[GW2EventNameList class]
                                        fromJSONDictionary:jSONDict
                                                     error:NULL];
        
        [self sortActiveEvents];
    }];
    
    //fetching events for map and server
    NSNumber *serverID = [[GW2UserSettings sharedSettings] loadServerID];
    [self.client fetchEventListForServerWithID:serverID
                                     mapWithID:self.selectedMap.mapID
                         withCompletionHandler:^(NSData* recievedData){
                             NSDictionary *jSONDict = [NSJSONSerialization JSONObjectWithData:recievedData
                                                                                      options:0
                                                                                        error:NULL];
                             weakself.events = [MTLJSONAdapter modelOfClass:[GW2EventList class]
                                                         fromJSONDictionary:jSONDict
                                                                      error:NULL];
    }];
}

- (void)sortActiveEvents
{
    self.activeEvents = [NSMutableArray array];
    self.activeEventNames = [NSMutableArray array];
    
    for (GW2Event *event in self.events.eventList) {
        if (event.eventState == GW2EventStatusActive) {
            [self.activeEvents addObject:event];
        }
    }
}

@end
