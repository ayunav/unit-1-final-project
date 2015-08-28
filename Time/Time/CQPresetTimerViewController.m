//
//  CQPresetTimerViewController.m
//  Time
//
//  Created by Ayuna Vogel on 8/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "CQPresetTimerViewController.h"

@interface CQPresetTimerViewController ()

@property (nonatomic) NSString *timerName;


@end

@implementation CQPresetTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //if coffee timer
    NSInteger seconds = 180;
   // [self.timerPickerView setDatePickerMode:UIDatePickerModeCountDownTimer];
    //[self.timerPickerView setCountDownDuration:seconds];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
