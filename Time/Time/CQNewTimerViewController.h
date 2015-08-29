//
//  CQNewTimerViewController.h
//  Time
//
//  Created by Ayuna Vogel on 8/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQTimer.h"

@interface CQNewTimerViewController : UIViewController

@property (nonatomic) CQTimer *timerObject;
@property (nonatomic) NSMutableArray *presetTimers;
@property (nonatomic) NSString *timerTitle;

@property (nonatomic) NSTimeInterval timerDuration;
@property (nonatomic) NSTimer *timer;

@property (nonatomic) int secondsCount;
@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@property (nonatomic) BOOL isTimerRunning;
@property (nonatomic) BOOL isTimerPaused;

@property (weak, nonatomic) IBOutlet UIDatePicker *timerPickerView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startCancelButtonTapped;
@property (weak, nonatomic) IBOutlet UIButton *pauseResumeButtonTapped;
@property (weak, nonatomic) IBOutlet UITextField *timerTitleTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *soundPickerView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButtonTapped;


@end
