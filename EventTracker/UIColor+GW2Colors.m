//
//  UIColor+GW2Colors.m
//  EventTracker
//
//  Created by Maria Saveleva on 23/04/14.
//  Copyright (c) 2014 Maria Saveleva. All rights reserved.
//

#import "UIColor+GW2Colors.h"

@implementation UIColor (GW2Colors)

+ (UIColor *)getColorForStatus:(GW2EventStatus)status
{
    switch (status) {
        case GW2EventStatusInactive:
            return [UIColor inactiveEventStatusLabelColor];
            break;
        case GW2EventStatusActive:
            return [UIColor activeEventStatusLabelColor];
            break;
        case GW2EventStatusSuccess:
            return [UIColor successEventStatusLabelColor];
            break;
        case GW2EventStatusFail:
            return [UIColor failEventStatusLabelColor];
            break;
        case GW2EventStatusWarmup:
            return [UIColor warmupEventStatusLabelColor];
            break;
        case GW2EventStatusPreparation:
            return [UIColor preparationEventStatusLabelColor];
            break;
        default:
            break;
    }
}

+ (UIColor *)inactiveEventStatusLabelColor
{
    //#7f7f7f
    return [UIColor colorWithRed:0x7f/255. green:0x7f/255. blue:0x7f/255. alpha:1];
}

+ (UIColor *)activeEventStatusLabelColor
{
    //#86c37a
    return [UIColor colorWithRed:0x86/255. green:0xc3/255. blue:0x7a/255. alpha:1];
}

+ (UIColor *)successEventStatusLabelColor
{
    //#f69904
    return [UIColor colorWithRed:0xf6/255. green:0x99/255. blue:0x04/255. alpha:1];
}

+ (UIColor *)failEventStatusLabelColor
{
    //#ab90bc
    return [UIColor colorWithRed:0xab/255. green:0x90/255. blue:0xbc/255. alpha:1];
}

+ (UIColor *)warmupEventStatusLabelColor
{
    //#c0c381
    return [UIColor colorWithRed:0xc0/255. green:0xc3/255. blue:0x81/255. alpha:1];
}

+ (UIColor *)preparationEventStatusLabelColor
{
    //#c0c381
    return [UIColor colorWithRed:0xc0/255. green:0xc3/255. blue:0x81/255. alpha:1];
}

@end
