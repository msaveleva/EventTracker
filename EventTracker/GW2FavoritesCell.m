//
//  GW2FavoritesCell.m
//  EventTracker
//
//  Created by Maria Saveleva on 19/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "GW2FavoritesCell.h"

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
    
    return self;
}

- (void)editCell
{
    NSLog(@"Swipe!");
}

@end
