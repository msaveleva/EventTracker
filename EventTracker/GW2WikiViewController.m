//
//  GW2WikiViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 11/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2WikiViewController.h"

static NSString * const kGW2WikiUrl = @"http://wiki.guildwars2.com/wiki/";

@interface GW2WikiViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *wikiWebView;

@end

@implementation GW2WikiViewController

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
    
    NSURL *url = [NSURL URLWithString:[self getUrlString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.wikiWebView loadRequest:request];
}

- (NSString *)getUrlString
{
    NSString *resultString = [self.eventName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    if ([resultString length] > 0) {
        resultString = [resultString substringToIndex:[resultString length] -1];
    }
    
    resultString = [kGW2WikiUrl stringByAppendingString:resultString];
    
    return resultString;
}

@end
