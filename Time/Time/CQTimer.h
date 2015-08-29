//
//  CQTimer.h
//  Time
//
//  Created by Ayuna Vogel on 8/28/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQTimer : NSObject

@property (nonatomic) CQTimer *model;//?
@property (nonatomic) NSMutableArray *presetTimers;
//@property (nonatomic) NSMutableArray *timerObjects; // same as above
@property (nonatomic) NSString *timerTitle;
@property (nonatomic) NSTimeInterval timerDuration;


@property (nonatomic) NSTimer *timer;
//@property (weak, nonatomic) IBOutlet UIDatePicker *timerPickerView;
//@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
//@property (weak, nonatomic) IBOutlet UIButton *startButtonTapped;
//@property (weak, nonatomic) IBOutlet UIButton *pauseButtonTapped;
//@property (weak, nonatomic) IBOutlet UITableView *timersTableView;
//@property (nonatomic) UIImage *timerBackgroundImage;
//@property (nonatomic) UIPickerView *alarmSound;//? not sure if typerd properly

@property (nonatomic) BOOL isTimerRunning;
@property (nonatomic) BOOL isTimerPaused;

@property (nonatomic) int secondsCount;
@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@end
