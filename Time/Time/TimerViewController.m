//
//  TimerViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *timerPickerView;
@property (nonatomic) NSMutableArray *existingPresetTimers;
@property (nonatomic) NSMutableArray *customPresetTimers;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.existingPresetTimers = [[NSMutableArray alloc] init];
    [self.existingPresetTimers addObject:@"Coffee timer"];
    [self.existingPresetTimers addObject:@"CPopcorn timer"];
    
    NSInteger seconds = 60;
    //[self.timerPickerView setDatePickerMode:UIDatePickerModeCountDownTimer];
    [self.timerPickerView setCountDownDuration:seconds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
      return self.existingPresetTimers.count;
}

- (UITableViewCell *)tableview:(UITableView *)tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:@"TimerCellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [self.existingPresetTimers objectAtIndex:indexPath.row];
    return cell; 
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
