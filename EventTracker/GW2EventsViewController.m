//
//  GW2EventsViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 27/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2EventsViewController.h"
#import "GW2ServerList.h"
#import "GW2Server.h"

@interface GW2EventsViewController ()

@property (strong, nonatomic) GW2ServerList *serverList;

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
    // Do any additional setup after loading the view.
    [self fetchData];
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

- (void)fetchData
{
    NSString *serverJSON = @"https://api.guildwars2.com/v1/world_names.json?lang=en";
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:serverJSON]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSArray *jSONArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                NSDictionary *jSONDict = @{@"serverList": jSONArray};
                NSLog(@"JSON: %@", jSONDict);
                self.serverList = [MTLJSONAdapter modelOfClass:[GW2ServerList class] fromJSONDictionary:jSONDict error:NULL];
                NSLog(@"ServerList: %@", [(GW2Server *)self.serverList.serverList[10] serverName]);
            }] resume];
}

@end
