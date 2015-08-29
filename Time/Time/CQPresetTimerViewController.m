//
//  CQPresetTimerViewController.m
//  Time
//
//  Created by Ayuna Vogel on 8/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "CQPresetTimerViewController.h"
#import "CQTimer.h"

@interface CQPresetTimerViewController ()

@property (nonatomic) CQTimer *timerObject;
@property (weak, nonatomic) IBOutlet UIDatePicker *timerPickerView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@end

@implementation CQPresetTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.timerPickerView.hidden = YES;
    self.timerLabel.text = self.timerObject.timerTitle;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
