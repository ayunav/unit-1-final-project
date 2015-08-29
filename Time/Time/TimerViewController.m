//
//  TimerViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TimerViewController.h"
#import "CQTimer.h"
#import "CQNewTimerViewController.h"
#import "CQPresetTimerViewController.h"

@interface TimerViewController () <NewTimerDelegate>

@property (nonatomic) NSTimer *timer;
@property (nonatomic) NSTimeInterval timerDuration;
@property (weak, nonatomic) IBOutlet UIDatePicker *timerPickerView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButtonTapped;
@property (weak, nonatomic) IBOutlet UIButton *pauseButtonTapped;
@property (weak, nonatomic) IBOutlet UITableView *timersTableView;

@property (nonatomic) NSMutableArray *presetTimers;

@property (nonatomic) BOOL isTimerRunning;
@property (nonatomic) BOOL isTimerPaused;

@property (nonatomic) int secondsCount;
@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isTimerRunning = NO;
    self.isTimerPaused = NO;
    self.pauseButtonTapped.enabled = NO;
    [self.timerLabel setHidden:YES];

    NSInteger seconds = 60;
    [self.timerPickerView setDatePickerMode:UIDatePickerModeCountDownTimer];
    [self.timerPickerView setCountDownDuration:seconds];
    
    //tableview methods
    if (!self.presetTimers) {
        self.presetTimers = [[NSMutableArray alloc] init];
    }
    
    CQTimer *coffeeTimer = [[CQTimer alloc] init];
    coffeeTimer.timerTitle = @"Coffee timer";
//    coffeeTimer.timerDuration = ;
    [self.presetTimers addObject:coffeeTimer];
    
    CQTimer *popcornTimer = [[CQTimer alloc] init];
    popcornTimer.timerTitle = @"Popcorn timer";
//    popcornTimer.timerDuration =
    [self.presetTimers addObject:popcornTimer];
    
    // Control dragging from tableview in the storyboard to the timer itself and setting it to its datasource and delegates implements the code below
    //    self.timersTableView.dataSource = self;
    //    self.timersTableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)timerFired: (NSTimer *)timer {
    self.secondsCount--;
    
    self.hours = self.secondsCount/3600;
    self.minutes = (self.secondsCount % 3600)/60;
    self.seconds = self.secondsCount - (self.hours * 3600) - (self.minutes * 60);
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", self.hours, self.minutes, self.seconds];
    self.timerLabel.hidden = NO;
    self.timerPickerView.hidden = YES;
    
    if (self.secondsCount <= 0) {
        
        [self.timer invalidate];
        self.timer = nil;
        
        [self.startButtonTapped setTitle:@"Start" forState:UIControlStateNormal];
        self.pauseButtonTapped.enabled = NO;
        
    }
}

#pragma mark - Button methods
//start & cancel Button Tapped
- (IBAction)startButtonTapped:(id)sender {
    
    self.timerDuration = self.timerPickerView.countDownDuration;
    
    self.seconds = 0;
    self.hours = (int)(self.timerDuration/3600.0f);
    self.minutes = ((int)self.timerDuration - (self.hours * 3600))/60;
    
    self.secondsCount = ((self.hours * 3600) + (self.minutes * 60));
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", self.hours, self.minutes, self.seconds];
    
    if (self.isTimerRunning == YES) {
        
        [self.startButtonTapped setTitle:@"Start" forState:UIControlStateNormal];
        [self.pauseButtonTapped setTitle:@"Pause" forState:UIControlStateNormal];
        self.pauseButtonTapped.enabled = NO;
        self.timerLabel.hidden = YES;
        self.timerPickerView.hidden = NO;
        
        [self.timer invalidate];
        self.timer = nil;
        
    } else {
        
        [self.startButtonTapped setTitle:@"Cancel" forState:UIControlStateNormal];
        self.pauseButtonTapped.enabled = YES;
        
        
        if (self.timer == nil) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
        }
    }
    
    self.isTimerRunning = !self.isTimerRunning;
}

//pause & resume Button Tapped
- (IBAction)pauseButtonTapped:(id)sender {
    if (self.isTimerPaused == NO) {
        [self.timer invalidate];
        self.timer = nil;
        
        [self.pauseButtonTapped setTitle:@"Resume" forState:UIControlStateNormal];
        
    } else {
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
        [self.pauseButtonTapped setTitle:@"Pause" forState:UIControlStateNormal];
    }
    
    self.isTimerPaused = !self.isTimerPaused;
}

#pragma mark - Table View methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presetTimers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.timersTableView dequeueReusableCellWithIdentifier:@"TimerCellIdentifier" forIndexPath:indexPath];
    
    CQTimer *timerTemp;
    timerTemp = [self.presetTimers objectAtIndex:indexPath.row];
    
    cell.textLabel.text = timerTemp.timerTitle;
    
    //NOTE Delete and reconfigure to use CQTimer --> below is a stop gag method
//
//    if (indexPath.row >=2) {
//        timerTemp = [self.presetTimers objectAtIndex:indexPath.row];
//        cell.textLabel.text = timerTemp.timerTitle;
//    }
//    
//    else{
//    cell.textLabel.text = [self.presetTimers objectAtIndex:indexPath.row];
//    }
    

    return cell;
}

#pragma mark - New Timer button tapped method

- (IBAction)newTimerButtonTapped:(UIBarButtonItem *)sender {
    
    if([sender.title isEqualToString:@"New Timer"]){
    
        CQNewTimerViewController *newTimerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NewTimerViewController"];
        newTimerVC.delegate = self;
        [self.navigationController pushViewController:newTimerVC animated:YES];
    }
}

#pragma mark - Delegate methods 

- (void) addToTheArrayNewTimer:(CQTimer *)newTimer {
    [self.presetTimers addObject:newTimer];
    [self.timersTableView reloadData]; 
}

#pragma mark - didSelectRowAtIndexPath

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CQPresetTimerViewController *presetTimerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PresetTimerViewController"];
    
    CQTimer *timerObject = self.presetTimers[indexPath.row];
    
    presetTimerVC.timerObject = timerObject;
    
    [self.navigationController pushViewController:presetTimerVC animated:YES];
    
}

@end
