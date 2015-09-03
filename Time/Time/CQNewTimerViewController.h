//
//  CQNewTimerViewController.h
//  Time
//
//  Created by Ayuna Vogel on 8/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQTimer.h"

@protocol NewTimerDelegate <NSObject>

- (void) addToTheArrayNewTimer:(CQTimer *)newTimer;

@end

@interface CQNewTimerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

  //  Delegate property adheres to this protocol NewTimerDelegate. The delegate (it could be any object because its type is id) must implement the methods inside the protocol.
@property (nonatomic, weak) id <NewTimerDelegate> delegate;

//@property (nonatomic) CQTimer *timerObject;
//@property (nonatomic) NSMutableArray *presetTimers;
@property (nonatomic) NSString *timerTitle;
@property (nonatomic) NSTimeInterval timerDuration;



@end
