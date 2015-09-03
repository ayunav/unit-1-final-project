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

@property (weak, nonatomic) IBOutlet UILabel *theTitle;




@end

@implementation ShowCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.theTitle.text = self.eventObject.userEventTitle;
     
       
}





@end
