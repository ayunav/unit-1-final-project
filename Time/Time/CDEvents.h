//
//  CDEvents.h
//  Time
//
//  Created by Christella on 9/2/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDEvents : NSObject

@property (nonatomic) CDEvents *eventObject;

@property (nonatomic) NSMutableArray *userEvents;

@property (nonatomic) NSString *userEventTitle;

@property (nonatomic) NSDate *date;


@end
