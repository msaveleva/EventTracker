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

@interface GW2EventsViewController ()

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
