//
//  TimerViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property (nonatomic) NSMutableArray *existingPresetTimers;
@property (nonatomic) NSMutableArray *customPresetTimers;

@property (weak, nonatomic) IBOutlet UIDatePicker *timerPickerView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButtonTapped;
@property (weak, nonatomic) IBOutlet UIButton *pauseButtonTapped;

// ? I need a property of NSTimer and NSTimeInterval
@property (nonatomic) NSTimeInterval *timerDuration;
@property (nonatomic) NSTimer *timer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.timerLabel setHidden:YES];

    self.existingPresetTimers = [[NSMutableArray alloc] init];
    [self.existingPresetTimers addObject:@"Coffee timer"];
    [self.existingPresetTimers addObject:@"Popcorn timer"];
    
    NSInteger seconds = 60;
    //[self.timerPickerView setDatePickerMode:UIDatePickerModeCountDownTimer];
    [self.timerPickerView setCountDownDuration:seconds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button methods 

- (IBAction)startButtonTapped:(id)sender {
    if(sender == self.startButtonTapped){
        [self.timerLabel setHidden:NO];
        [self.timerPickerView setHidden:YES];
        [sender setTitle:@"Stop" forState: UIControlStateNormal];
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        
//
//        self.countDownDuration = self.pickerView.countDownDuration;
//        
//        NSLog(@"%f",self.pickerView.countDownDuration);
    }
}

- (void)timerFired: (NSTimer *)timer {
//    NSInteger currentNumber = [self.timerLabel.text integerValue];
//    NSInteger nextNumber = currentNumber + 1;
//    
//    self.timerLabel.text = [NSString stringWithFormat:@"%lu", nextNumber];
//    
//    if (nextNumber == 10) {
//        [timer invalidate];
//    }
//    NSLog(@"Timer fired");
}

#pragma mark - Table View methods 

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
