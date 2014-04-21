//
//  GW2EventsViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 27/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2EventsViewController.h"
#import "GW2UserSettings.h"
#import "GW2Map.h"
#import "GW2Event.h"
#import "GW2EventList.h"
#import "GW2EventName.h"
#import "GW2EventNameList.h"
#import "GW2WikiViewController.h"
#import "GW2EventManager.h"

static NSString * const kEvemtListCellIdentifier = @"eventListCell";
static NSString * const kShowWikiForEvent = @"showWikiForEvent";

@interface GW2EventsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *eventListTableView;
@property (retain, nonatomic) UIBarButtonItem *doneBarButtonItem;
@property (retain, nonatomic) UIBarButtonItem *addBarButtonItem;
@property (strong, nonatomic) GW2EventList *events;
@property (strong, nonatomic) GW2EventNameList *eventNames;
@property (strong, nonatomic) NSMutableArray *activeEvents;
@property (strong, nonatomic) NSMutableArray *activeEventNames;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) NSArray *favoritEvents;

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
    
    self.eventListTableView.allowsSelectionDuringEditing = YES;
    self.eventListTableView.allowsMultipleSelectionDuringEditing = YES;
    
    self.favoritEvents = [[GW2UserSettings sharedSettings] loadUserEventIDandName];
    
    //custom barButtonItems
    self.doneBarButtonItem =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self
                                                      action:@selector(finishAddingToFavorites)];
    self.addBarButtonItem =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                      target:self
                                                      action:@selector(addToFavorites)];
    self.navigationItem.rightBarButtonItem = self.addBarButtonItem;
    
    //activity indicator implementation
    self.activityIndicator =
        [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.center = self.view.center;
    [self.view addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    
    //get data for tableView
    GW2EventManager *eventManager = [GW2EventManager sharedManager];
    [eventManager recieveEventListFromManagerForMap:self.selectedMap withCompletion:^(GW2EventList *eventList){
        self.events = eventList;
    }];
    
    [eventManager recieveEventNameListFromManager:^(GW2EventNameList *eventNameList){
        self.eventNames = eventNameList;
        
        [self sortActiveEvents];
        [self.eventListTableView reloadData];
        
        [self.activityIndicator stopAnimating];
    }];
}

- (void)sortActiveEvents
{
    self.activeEvents = [NSMutableArray array];
    self.activeEventNames = [NSMutableArray array];
    
    for (GW2Event *event in self.events.eventList) {
        if (event.eventState == GW2EventStatusActive) {
            [self.activeEvents addObject:event];
            
            for (int i = 0; i < [self.eventNames.eventNameList count]; i++) {
                GW2EventName *eventName = self.eventNames.eventNameList[i];
                if ([event.eventID isEqualToString:eventName.eventID]) {
                    [self.activeEventNames addObject:eventName];
                    break;
                }
            }
        }
    }
}

- (void)addToFavorites{
    self.navigationItem.rightBarButtonItem = self.doneBarButtonItem;
    [self.eventListTableView setEditing:YES animated:YES];
}

- (void)finishAddingToFavorites{
    self.navigationItem.rightBarButtonItem = self.addBarButtonItem;
    [self.eventListTableView reloadData];
    [self.eventListTableView setEditing:NO animated:YES];
}

#pragma mark - TableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.activeEvents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kEvemtListCellIdentifier
                                                            forIndexPath:indexPath];
    GW2EventName *eventName = self.activeEventNames[indexPath.row];
    cell.textLabel.text = eventName.eventName;
    
    for (NSDictionary *event in self.favoritEvents) {
        NSString *eventID = [event objectForKey:@"eventID"];
        if ([eventName.eventID isEqualToString:eventID]) {
            cell.backgroundColor = [UIColor grayColor];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.isEditing) {
        NSString *eventName = [self.activeEventNames[indexPath.row] eventName];
        NSString *event = [self.activeEvents[indexPath.row] eventID];
        NSDictionary *favoriteEvent = [NSDictionary dictionaryWithObjectsAndKeys:eventName, @"eventName", event, @"eventID", nil];
        [GW2UserSettings sharedSettings].userEventIDandName = favoriteEvent;
    } else {
        NSIndexPath *indexpath = [self.eventListTableView indexPathForSelectedRow];
        GW2WikiViewController *destinationVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:kShowWikiForEvent];
        NSString *selectedEventName = [self.eventNames.eventNameList[indexpath.row] eventName];
        destinationVC.eventName = selectedEventName;
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
}

#pragma mark - TableView editing methods

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}

@end
