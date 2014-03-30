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
    
    GW2Client *client = [GW2Client new];
    client.delegate = self;
    [client fetchServerList];
}

#pragma mark - Table View methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.servers.serverList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kServerListCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kServerListCellIdentifier];
    }
    
    cell.textLabel.text = [self.servers.serverList[indexPath.row] name];
    
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
