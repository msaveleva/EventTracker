//
//  GW2FavoritesCell.m
//  EventTracker
//
//  Created by Maria Saveleva on 19/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2FavoritesCell.h"

const CGFloat kLeftLabelMargin = 87.0f;
const CGFloat kMinLeftLabelMargin = 10.0f;

@interface GW2FavoritesCell ()

@property (strong, nonatomic) UISwipeGestureRecognizer *swipeGesture;

@end

@implementation GW2FavoritesCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    self.swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(editCell)];
    [self.swipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    [self addGestureRecognizer:self.swipeGesture];
    self.isCellEditing = NO;
    
    return self;
}

- (void)editCell
{
    if (!self.isCellEditing) {
        self.isCellEditing = YES;
        [UIView animateWithDuration:10.0f animations:^{
            self.leftLabelConstraint.constant = kLeftLabelMargin;
        }];
        NSLog(@"Is editing");
    } else {
        self.isCellEditing = NO;
        [UIView animateWithDuration:10.8f animations:^{
            self.leftLabelConstraint.constant = kMinLeftLabelMargin;
        }];
        NSLog(@"Is not editing");
    }
}

@end
