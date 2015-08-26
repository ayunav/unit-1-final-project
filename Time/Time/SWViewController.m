//
//  SWViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Christella Dolmo. All rights reserved.
//

#import "SWViewController.h"

@interface SWViewController ()

@property (nonatomic) NSTimer *timer;

@property (nonatomic) NSDate *startTime;

@property (nonatomic) NSTimeInterval totalSessionTime;

@property (nonatomic) NSTimeInterval totalTime;


@end

@implementation SWViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swLabel.text = @"00:00:00";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)stopwatchButton:(id)sender {
    
    
    // set self.startTime to now. Always initializes to current date and time
    self.startTime = [[NSDate alloc] init];
    // setup timer
    self.timer = [NSTimer timerWithTimeInterval:1/60.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    // add timer to the run loop
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [sender setTitle:@"STOP" forState:UIControlStateNormal];
        
    
    
}

- (void)timerFired:(NSTimer *)timer {
    
    // get the current time
    NSDate *now = [[NSDate alloc] init];
    
    self.totalSessionTime = [now timeIntervalSinceDate:self.startTime];
    NSTimeInterval distance =  self.totalTime + self.totalSessionTime;
    
    self.swLabel.text = [NSString stringWithFormat:@"%0.2f", distance];
   
}






@end
