//
//  GW2MapViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 27/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2FavoritesViewController.h"
#import "GW2UserSettings.h"
#import "GW2EventManager.h"
#import "GW2Event.h"
#import "GW2FavoritesCell.h"

static NSString *const kFavoritesCell = @"favoritesCell";

@interface GW2FavoritesViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *favoritesCollectionView;
@property (strong, nonatomic) NSArray *userFavoritEventIDs;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) NSMutableArray *allEventsDetails;

@end

@implementation GW2FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.favoritesCollectionView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.allEventsDetails = [NSMutableArray new];
    self.userFavoritEventIDs = [[GW2UserSettings sharedSettings] loadUserEventIDandName];
    GW2EventManager *eventManager = [GW2EventManager sharedManager];
    
    //activity indicator implementation
    self.activityIndicator =
    [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.center = self.view.center;
    [self.view addSubview:self.activityIndicator];
    if ([self.userFavoritEventIDs count] > 0) {
        [self.activityIndicator startAnimating];
    }
    
    for (NSDictionary *event in self.userFavoritEventIDs) {
        NSString *eventID = (NSString *)[event objectForKey:@"eventID"];
        [eventManager recieveEventDetailsFromManagerForEventID:eventID withCompletion:^(GW2Event *eventDetails){
            [self.allEventsDetails addObject:eventDetails];
            [self.favoritesCollectionView reloadData];
            
            if (self.activityIndicator.isAnimating) {
                [self.activityIndicator stopAnimating];
            }
        }];
    }
}

- (NSString *)convertEventStateFromState:(GW2EventStatus)status
{
    switch (status) {
        case GW2EventStatusInactive:
            return @"Inactive";
            break;
        case GW2EventStatusActive:
            return @"Active";
            break;
        case GW2EventStatusSuccess:
            return @"Success";
            break;
        case GW2EventStatusFail:
            return @"Fail";
            break;
        case GW2EventStatusWarmup:
            return @"Warmup";
            break;
        case GW2EventStatusPreparation:
            return @"Preparation";
            break;
        default:
            break;
    }
}

#pragma mark - UICollectionView methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.userFavoritEventIDs count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GW2FavoritesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFavoritesCell
                                                                       forIndexPath:indexPath];
    
    if (self.allEventsDetails.count != 0 && indexPath.row < [self.allEventsDetails count]) {
        GW2Event *event = self.allEventsDetails[indexPath.row];
        NSDictionary *eventInfo = self.userFavoritEventIDs[indexPath.row];
        cell.eventStatusLabel.text = [self convertEventStateFromState:event.eventState];
        cell.eventNameLabel.text = [eventInfo objectForKey:@"eventName"];
    }
    
    return cell;
}

@end
