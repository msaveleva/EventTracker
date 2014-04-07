    //
//  GW2ServerListViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 27/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2ServerListViewController.h"
#import "GW2Server.h"
#import "GW2ServerList.h"
#import "GW2Client.h"
#import "GW2UserSettings.h"

static NSString *kServerListCellIdentifier = @"serverListCellIdentifier";

@interface GW2ServerListViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *serversTableView;
@property (strong, nonatomic) GW2ServerList *servers;
@property (strong, nonatomic) GW2Client *client;

@end

@implementation GW2ServerListViewController

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
    
    self.client = [GW2Client new];
    
    __weak typeof(self) weakself = self;
    [self.client fetchSeverListWithCompletionHandler:^(NSData *recievedData){
        NSArray *jSONArray = [NSJSONSerialization JSONObjectWithData:recievedData
                                                             options:0
                                                               error:NULL];
        NSDictionary *jSONDict = @{@"eventNameList": jSONArray};
        weakself.servers = [MTLJSONAdapter modelOfClass:[GW2ServerList class]
                                     fromJSONDictionary:jSONDict
                                                  error:NULL];
        
        [weakself.serversTableView reloadData];
    }];
}

#pragma mark - Table View methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.servers.serverList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kServerListCellIdentifier
                             forIndexPath:indexPath];
    
    cell.textLabel.text = @"Text";
    cell.textLabel.text = [self.servers.serverList[indexPath.row] serverName];
    
    NSNumber *savedServerID = [[GW2UserSettings sharedSettings] loadServerID];
    if ([[self.servers.serverList[indexPath.row] serverID] isEqual:savedServerID]) {
        cell.accessoryType =  UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *selectedServerID = [self.servers.serverList[indexPath.row] serverID];
    [[GW2UserSettings sharedSettings] setUserServerID:selectedServerID];
    
    if (self.navigationController != nil) {
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
        [tableView reloadData];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
