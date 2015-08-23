//
//  SWViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTimer
{
    static NSInteger counter = 0;
    self.SWlabel.text = [NSString stringWithFormat:@"Counter: %li", (long)counter++];
}





- (IBAction)startTimer:(id)sender {
   
    self.startDate = [NSDate date];
    
    // Create the stop watch timer that fires every 100 ms
    self.stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0
            target:self
          selector:@selector(updateTimer)
          userInfo:nil
           repeats:YES];
}

- (IBAction)pauseTimer:(id)sender {
    self.SWlabel.text=@"stop pressed";
    
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
