//
//  SWViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Christella Dolmo. All rights reserved.
//

#import "SWViewController.h"
#import "Stopwatch.h"
#import "Format.h"

@interface SWViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDate *startDate;

@property (nonatomic) NSTimeInterval totalSessionTime;
@property (nonatomic) NSTimeInterval totalTime;
@property (nonatomic, assign, readwrite) NSTimeInterval currentLapTime;

@property (nonatomic, strong) NSDate *currentLapStartTime;

@property (weak, nonatomic) IBOutlet UITableView *lapsTableView;

@property (strong, nonatomic) NSTimer *stopWatchTimer;

@property (nonatomic, strong) Stopwatch *stopwatch;

@end

@implementation SWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swLabel.text = @"00:00:00.000";
    
    
   // self.lapView.dataSource = self;
}


- (IBAction)stopwatchButton:(id)sender {
  
    self.startDate = [[NSDate alloc]init];
    
    //create the stop watch timer that fires every 100 ms
    self.stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
 
}

- (IBAction)stopwatchPause:(id)sender {
    
    self.totalTime = self.totalTime + self.totalSessionTime;
    
    [self.stopWatchTimer invalidate];

}

-(void)updateTimer {
    
    //create date from the elapsed time
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    //create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    //formtat the elapsed time and set it to the label
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    self.swLabel.text= timeString;
    
    self.totalSessionTime = [currentDate timeIntervalSinceDate:self.startDate];
    NSTimeInterval distance = self.totalTime + self.totalSessionTime;
    
    self.swLabel.text = [NSString stringWithFormat:@"%0.2f", distance];
    
}

#pragma mark - Lap Settup



- (IBAction)lapButton:(id)sender {
    
    [self.stopwatch addLap];
    
    [self.lapsTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]
                              withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.stopwatch.laps count];
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.lapsTableView dequeueReusableCellWithIdentifier:@"lapViewCell"];
    
    unsigned long lapNumber = [[self.stopwatch laps] count];
    NSNumber *lapTime = [[self.stopwatch laps] objectAtIndex:lapNumber - 1];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Lap %lu", lapNumber];
    cell.detailTextLabel.text = [NSString tcd_formatTime:[lapTime doubleValue]];
    
    return cell;
}


@end
