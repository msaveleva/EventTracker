//
//  UIColor+GW2Colors.h
//  EventTracker
//
//  Created by Maria Saveleva on 23/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GW2Event.h"

@interface UIColor (GW2Colors)

+ (UIColor *)getColorForStatus:(GW2EventStatus)status;

+ (UIColor *)inactiveEventStatusLabelColor;
+ (UIColor *)activeEventStatusLabelColor;
+ (UIColor *)successEventStatusLabelColor;
+ (UIColor *)failEventStatusLabelColor;
+ (UIColor *)warmupEventStatusLabelColor;
+ (UIColor *)preparationEventStatusLabelColor;

@end
