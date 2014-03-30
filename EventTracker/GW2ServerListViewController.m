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

@property (strong, nonatomic) GW2ServerList *serverList;

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
    
    [[GW2Client sharedInstance] fetchServerList];
}

#pragma mark - Table View methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5; //TODO: implement
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kServerListCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kServerListCellIdentifier];
    }
    
    cell.textLabel.text = @"Server Name"; //TODO: implement
    
    return cell;
}

#pragma mark - GW2Protocol methods

- (void)recievedJSONData:(NSData *)data
{
    NSArray *jSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:NULL];
    NSDictionary *jSONDict = @{@"serverList": jSONArray};
    self.serverList = [MTLJSONAdapter modelOfClass:[GW2ServerList class]
                                fromJSONDictionary:jSONDict
                                             error:NULL];
}

@end
