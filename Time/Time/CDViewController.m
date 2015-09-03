//
//  CDViewController.m
//  Time
//
//  Created by Christella on 8/31/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "CDViewController.h"
#import "CDEvents.h"
#import "AddCDViewController.h"


@interface CDViewController ()


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *countdownTitle;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;

@property (weak, nonatomic) IBOutlet UILabel *eventDisplayed;




@end

@implementation CDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)startCountdown:(id)sender {
    
    //Remove the time component from the datePicker.  We care only about the date
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSUInteger preservedComponents = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay);
    self.datePicker.date = [calendar dateFromComponents:[calendar components:preservedComponents fromDate:self.datePicker.date]];
    
    //Set up a timer that calls the updateTime method every second to update the label
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateTime)
                                           userInfo:nil
                                            repeats:YES];
}

-(void)updateTime
{
    //Get the time left until the specified date
    NSInteger ti = ((NSInteger)[self.datePicker.date timeIntervalSinceNow]);
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600) % 24;
    NSInteger days = (ti / 86400);
    
    //Update the label with the remaining time
    self.countdownLabel.text = [NSString stringWithFormat:@"%02li days %02li hrs %02li min %02li sec", (long)days, (long)hours, (long)minutes, (long)seconds];
    
    NSDate *myDate = self.datePicker.date;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"cccc, MMM d, hh:mm aa"];
    NSString *theEventDate = [dateFormat stringFromDate:myDate];
    
    self.eventDisplayed.text = theEventDate;
}

- (IBAction)saveButton:(id)sender {
    CDEvents *newEvent = [[CDEvents alloc] init];
    newEvent.userEventTitle = self.countdownTitle.text;
    newEvent.date = self.datePicker.date;
    
    [self.delegate addToTheArrayNewEvent: newEvent];
    
     NSLog(@"%@", newEvent);
    
    [self.navigationController popToRootViewControllerAnimated:YES];
   
}







@end
