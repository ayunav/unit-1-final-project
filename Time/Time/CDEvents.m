//
//  CDEvents.m
//  Time
//
//  Created by Christella on 9/2/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "CDEvents.h"
#import "Events.h"

@implementation CDEvents

+ (CDEvents *)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}



-(void) initializeEvents {
    
    self.events = [[NSMutableArray alloc]init];

}

@end
