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
@property (nonatomic) NSMutableArray *presetTimers;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSInteger seconds = 60;
    
    //[self.timerPickerView setDatePickerMode:UIDatePickerModeCountDownTimer];
    [self.timerPickerView setCountDownDuration:seconds];
    
    [self.presetTimers addObject:@"Coffee timer"];
    [self.presetTimers addObject:@"Popcorn timer"];
    
    //    [self.customTimers addObject:@"+ Add a Custom Timer"];
//    [self.presetTimers addObject:@"23"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if(section == 0){
//        return self.presetTimers.count;
//    }
//    else{
        return self.presetTimers.count;
//    }
}

- (UITableViewCell *)tableview:(UITableView *)tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:@"TimerCellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [self.presetTimers objectAtIndex:indexPath.row];
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
