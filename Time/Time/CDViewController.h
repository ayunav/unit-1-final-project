//
//  CDViewController.h
//  Time
//
//  Created by Christella on 8/31/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabe;;
@property (weak, nonatomic) IBOutlet UITextField *countdownTitle;




@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;

- (IBAction)startCountdown:(id)sender;

@end
