//
//  ShowCDViewController.m
//  Time
//
//  Created by Christella on 9/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ShowCDViewController.h"
#import "CDViewController.h"

@interface ShowCDViewController ()

@property (weak, nonatomic) IBOutlet UILabel *theTitle;

@property (weak, nonatomic) IBOutlet UILabel *showCountdown;



@end

@implementation ShowCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.theTitle.text = self.eventObject.userEventTitle;
    
    [self displayUpdatedTime];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(displayUpdatedTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //Get the time left until the specified date

//    
//    NSDate *myDate = self.datePicker.date;
//    
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"cccc, MMM d, hh:mm aa"];
//    NSString *theEventDate = [dateFormat stringFromDate:myDate];


}

- (void)displayUpdatedTime {
    NSInteger ti = ((NSInteger)[self.eventObject.date timeIntervalSinceNow]);
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600) % 24;
    NSInteger days = (ti / 86400);
    
    //Update the label with the remaining time
    self.showCountdown.text = [NSString stringWithFormat:@"%02li days %02li hrs %02li min %02li sec", (long)days, (long)hours, (long)minutes, (long)seconds];
}





@end
