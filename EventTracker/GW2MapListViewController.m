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
#import "GW2Client.h"

static NSString *kMapListIdentifier = @"mapListCell";

@interface GW2MapListViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (weak, nonatomic) IBOutlet UICollectionView *mapListCollectionView;
@property (strong, nonatomic) GW2MapList *mapList;
@property (strong, nonatomic) GW2Client *client;

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
    
    __weak typeof(self) weakself = self;
    self.client = [GW2Client new];
    [self.client fetchMapListWithCompletionHandler:^(NSData *recievedData){
        NSArray *jSONArray = [NSJSONSerialization JSONObjectWithData:recievedData
                                                             options:0
                                                               error:NULL];
        NSDictionary *jSONDict = @{@"allMaps": jSONArray};
        weakself.mapList = [MTLJSONAdapter modelOfClass:[GW2MapList class]
                                     fromJSONDictionary:jSONDict
                                                  error:NULL];
        
        [weakself.mapListCollectionView reloadData];
    }];
}

#pragma mark - UICollectionView methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.mapList.allMaps count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMapListIdentifier
                                                                           forIndexPath:indexPath];
    
    return cell;
}

@end
