//
//  AddCDViewController.h
//  Time
//
//  Created by Christella on 9/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDEvents.h"

@interface AddCDViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) CDEvents *eventObject;


@end
