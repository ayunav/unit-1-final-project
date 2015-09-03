//
//  ShowCDViewController.h
//  Time
//
//  Created by Christella on 9/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCDViewController : UIViewController

@property (nonatomic) CDEvents *eventObject;
@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;


@end
