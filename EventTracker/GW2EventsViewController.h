//
//  GW2EventsViewController.h
//  EventTracker
//
//  Created by Maria Saveleva on 27/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GW2Map;

@interface GW2EventsViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>

@property (strong, nonatomic) GW2Map *selectedMap;

@end
