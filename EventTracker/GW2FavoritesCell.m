//
//  GW2FavoritesCell.m
//  EventTracker
//
//  Created by Maria Saveleva on 19/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2FavoritesCell.h"

static CGFloat kMinContentMargin = 10.0f;
static CGFloat kMaxContentMargin = 94.0f;
static CGFloat kAnimationSpeed = 0.5f;

@interface GW2FavoritesCell ()

@property (strong, nonatomic) UISwipeGestureRecognizer *leftSwipeGesture;
@property (strong, nonatomic) UISwipeGestureRecognizer *rightSwipeGesture;

@end

@implementation GW2FavoritesCell

- (void)awakeFromNib
{
    self.leftSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleLeftSwipe:)];
    [self.leftSwipeGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self addGestureRecognizer:self.leftSwipeGesture];
    
    self.rightSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleRightSwipe:)];
    [self.rightSwipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    [self addGestureRecognizer:self.rightSwipeGesture];
    
    self.isEditing = NO;
    self.animatedConstraint.constant = kMinContentMargin;
}

- (IBAction)removeFromFavorites:(id)sender {
}

#pragma mark - Edition mode animation

- (void)handleLeftSwipe:(id)sender
{
    [UIView animateWithDuration:kAnimationSpeed animations:^{
        self.animatedConstraint.constant = kMinContentMargin;
    } completion:^(BOOL isFinished){
        self.isEditing = NO;
    }];
}

- (void)handleRightSwipe:(id)sender
{
    [UIView animateWithDuration:kAnimationSpeed animations:^{
        self.animatedConstraint.constant = kMaxContentMargin;
    } completion:^(BOOL isFinished){
        self.isEditing = YES;
    }];
}

@end
