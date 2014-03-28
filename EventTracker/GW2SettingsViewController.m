//
//  GW2SettingsViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 27/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2SettingsViewController.h"

static NSString *kCellIdentifier = @"settingsCell";

@interface GW2SettingsViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

typedef NS_ENUM(NSUInteger, GW2SettingsTableViewCellType) {
    GW2SettingsTableViewCellTypeChangeServer = 0,
    GW2SettingsTableViewCellTypeMapIcons,
    GW2SettingsTableViewCellTypeCount,
};

@end

@implementation GW2SettingsViewController

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
    return GW2SettingsTableViewCellTypeCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    
    switch (indexPath.row) {
        case GW2SettingsTableViewCellTypeChangeServer:
        {
            cell.textLabel.text = @"Change Server";
            return cell;
        }
        case GW2SettingsTableViewCellTypeMapIcons:
        {
            cell.textLabel.text = @"Map Icons";
            return cell;
        }

        return nil;
    }
    
    //TODO: implement
    
    return cell;
}

@end
