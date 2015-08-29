//
//  CQPresetTimerViewController.h
//  Time
//
//  Created by Ayuna Vogel on 8/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQTimer.h"

@interface CQPresetTimerViewController : UIViewController

@property (nonatomic) CQTimer *timerObject;
@property (weak, nonatomic) IBOutlet UIDatePicker *timerPickerView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerTitleLabel;

@end
