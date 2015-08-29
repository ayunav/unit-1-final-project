//
//  Format.m
//  Time
//
//  Created by Christella on 8/29/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "Format.h"

@implementation NSString (Format)

+ (NSString *)tcd_formatTime:(NSTimeInterval)time
{
    int seconds = (int)time;
    int milliseconds = (time - seconds) * 90;
    int minutes = (int)time / 60;
    
    return [NSString stringWithFormat:@"%02i:%02i.%02i", minutes % 60, seconds % 60, milliseconds % 60];
}


@end
