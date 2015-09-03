//
//  CQTimer.h
//  Time
//
//  Created by Ayuna Vogel on 8/28/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQTimer : NSObject

@property (nonatomic) CQTimer *timerObject;
@property (nonatomic) NSMutableArray *presetTimers;
@property (nonatomic) NSString *timerTitle;
@property (nonatomic) NSTimeInterval timerDuration;

@property (nonatomic) NSTimer *timer;
@property (nonatomic) BOOL isTimerRunning;
@property (nonatomic) BOOL isTimerPaused;

@property (nonatomic) int secondsCount;
@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@property (nonatomic) NSURL *soundURL; 
@property (nonatomic) NSString *soundName;


@end
