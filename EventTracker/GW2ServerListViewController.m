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
    self.client.delegate = self;
    [self.client fetchServerList];
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
    
    return cell;
}

#pragma mark - GW2Protocol methods

- (void)recievedJSONData:(NSData *)data
{
    NSArray *jSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:NULL];
    NSDictionary *jSONDict = @{@"serverList": jSONArray};
    self.servers = [MTLJSONAdapter modelOfClass:[GW2ServerList class]
                                fromJSONDictionary:jSONDict
                                             error:NULL];
    [self.serversTableView reloadData];
}

@end
