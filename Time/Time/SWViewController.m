//
//  SWViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Christella Dolmo. All rights reserved.
//

#import "SWViewController.h"

@interface SWViewController ()

@end

@implementation SWViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swLabel.text = @"0:00.0";
    running = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateTime {
    
    if (running == false) return;
    //calculate elapsed time
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsed = currentTime - startTime;
    
    //extract out the minutes, seconds, and fractions of seconds from elapsed time:
    int mins = (int) (elapsed / 60.0);
    elapsed -= mins * 60;
    int secs = (int) (elapsed);
    elapsed -= secs;
    int fraction = elapsed * 10.0;
    
    //update our label using a format of 0:00.0
    self.swLabel.text = [NSString stringWithFormat:@"%u:%02u.%u", mins, secs, fraction];
    //call updateTime again after 0.1 second
    [self performSelector:@selector(updateTime) withObject:self afterDelay:0.1];
}

- (IBAction)startButton:(UIButton *)sender {
    if (running == false)
    {
        //start timer
        running = true;
        startTime = [NSDate timeIntervalSinceReferenceDate];
        [sender setTitle:@"STOP" forState:UIControlStateNormal];
        [self updateTime];
    }
    else
    {
        // stop timer
        [sender setTitle:@"START" forState:UIControlStateNormal];
        running = false;
    }
}




@end
