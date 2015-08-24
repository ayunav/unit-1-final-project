//
//  SWViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Christella Dolmo. All rights reserved.
//

#import "SWViewController.h"

@interface SWViewController ()

@property (weak, nonatomic) IBOutlet UILabel *SWlabel;

@property (strong, nonatomic) NSTimer *stopWatchTimer; // Store the timer that fires after a certain time
@property (strong, nonatomic) NSDate *startDate; // Stores the date of the click on the start button

@end

@implementation SWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.SWlabel.text = @"00:00:00";
    running = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTimer
{
    // Create date from the elapsed time
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    // Create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    // Format the elapsed time and set it to the label
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    self.SWlabel.text = timeString;
}

- (IBAction)startTimer:(id)sender {
    
        if (running == false) {
            //start timer
            running = true;
            startTime = [NSDate timeIntervalSinceReferenceDate];
            [sender setTitle:@"STOP" forState: UIControlStateNormal];
            [self updateTimer];

        }
        else
        {
            //stop timer
            [sender setTitle:@"START" forState:UIControlStateNormal];
            running = false;
        }
    
    
    
    self.startDate = [NSDate date];
    
    // Create the stop watch timer that fires every 100 ms
    self.stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
            target:self
          selector:@selector(updateTimer)
          userInfo:nil
           repeats:YES];
}

- (IBAction)pauseTimer:(id)sender {
    
    [self.stopWatchTimer invalidate];
    self.stopWatchTimer = nil;
    [self updateTimer];
    
}

- (void)timerFired:(NSTimer *)timer {
    
}









/*
#pragma mark - Navigation   `

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
