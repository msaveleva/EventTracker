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

static NSString *kServerListCellIdentifier = @"serverListCellIdentifier";

@interface GW2ServerListViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (strong, nonatomic) NSArray *serverList;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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

- (void)fetchData
{
    NSString *serverJSON = @"https://api.guildwars2.com/v1/world_names.json?lang=en";
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:serverJSON]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSDictionary *jSONDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                self.serverList =
                    [MTLJSONAdapter modelOfClass:[GW2ServerList class] fromJSONDictionary:jSONDict error:NULL];
            }] resume];
}

@end
