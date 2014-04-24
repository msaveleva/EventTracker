//
//  GW2FavoritesCell.m
//  EventTracker
//
//  Created by Maria Saveleva on 19/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2FavoritesCell.h"

@interface GW2FavoritesCell ()

@property (strong, nonatomic) UISwipeGestureRecognizer *leftSwipeGesture;
@property (strong, nonatomic) UISwipeGestureRecognizer *rightSwipeGesture;

@end

@implementation GW2FavoritesCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSwipe:)];
        [self.leftSwipeGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
        [self addGestureRecognizer:self.leftSwipeGesture];
        
        self.rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipe:)];
        [self.rightSwipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
        [self addGestureRecognizer:self.rightSwipeGesture];
    }
    return self;
}

- (IBAction)removeFromFavorites:(id)sender {
}

#pragma mark - Edition mode animation

- (void)handleLeftSwipe:(id)sender
{
    
}

- (void)handleRightSwipe:(id)sender
{
    
}

@end
