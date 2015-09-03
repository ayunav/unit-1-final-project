//
//  CDViewController.h
//  Time
//
//  Created by Christella on 8/31/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDEvents.h"



@protocol NewEventDelegate <NSObject>

-(void) addToTheArrayNewEvent:(CDEvents *)newEvent;



@end

@interface CDViewController : UIViewController


@property (nonatomic, weak) id <NewEventDelegate> delegate;

@property (nonatomic) NSString *cdEventTitle;




- (IBAction)startCountdown:(id)sender;

@end
