//
//  TimerViewController.h
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQTimer.h"

@interface TimerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) CQTimer *timerObject;

@end
