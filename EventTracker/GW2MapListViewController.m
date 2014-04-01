//
//  GW2MapListViewController.m
//  EventTracker
//
//  Created by Maria Saveleva on 31/03/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2MapListViewController.h"
#import "GW2Map.h"
#import "GW2MapList.h"

static NSString *kMapListIdentifier = @"mapListCell";

@interface GW2MapListViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (strong, nonatomic) GW2MapList *mapList;

@end

@implementation GW2MapListViewController

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

#pragma mark - UICollectionView methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5; //TODO: implement
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMapListIdentifier
                                                                           forIndexPath:indexPath];
    
    //TODO: implement
    
    return cell;
}

@end
