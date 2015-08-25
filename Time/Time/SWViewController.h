//
//  SWViewController.h
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWViewController : UIViewController
{
    bool running;
    NSTimeInterval startTime;
}
@property (weak, nonatomic) IBOutlet UILabel *swLabel;

- (IBAction)startButton:(UIButton *)sender;1

@end
