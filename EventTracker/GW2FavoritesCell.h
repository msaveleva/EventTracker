//
//  GW2FavoritesCell.h
//  EventTracker
//
//  Created by Maria Saveleva on 19/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GW2FavoritesCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventStatusLabel;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLabelConstraint;
@property (nonatomic) BOOL isCellEditing;

@end
