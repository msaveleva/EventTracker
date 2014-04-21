//
//  GW2SettingsViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 27/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2SettingsViewController.h"
#import "GW2ServerListViewController.h"

static NSString * const kCellIdentifier = @"settingsCell";

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

#pragma mark - Table View methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //TODO: return for map tiles
//    return GW2SettingsTableViewCellTypeCount;
    return 1;
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
            
        //TODO: return for map tiles
//        case GW2SettingsTableViewCellTypeMapIcons:
//        {
//            cell.textLabel.text = @"Map Icons";
//            return cell;
//        }

        return nil;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GW2ServerListViewController *viewController;
    switch (indexPath.row) {
        case GW2SettingsTableViewCellTypeChangeServer:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"serverList"];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        case GW2SettingsTableViewCellTypeMapIcons:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
