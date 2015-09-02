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

@end

@implementation ShowCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.countDownLabel.text = self.EventName;
   
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
