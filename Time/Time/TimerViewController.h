//
//  TimerViewController.h
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQTimer.h"

//@protocol PresetTimerDelegate <NSObject>
//
//@end
//

@interface TimerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic, weak) id <PresetTimerDelegate> delegate;
@property (nonatomic) CQTimer *timerObject;

@end
