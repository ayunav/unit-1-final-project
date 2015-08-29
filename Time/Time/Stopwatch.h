//
//  Stopwatch.h
//  Time
//
//  Created by Christella on 8/29/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stopwatch : NSObject

@property (nonatomic, assign, readonly) NSTimeInterval currentTime;
@property (nonatomic, assign, readonly) NSTimeInterval currentLapTime;
@property (nonatomic, copy, readonly) NSMutableArray *laps;
@property (nonatomic, assign, readonly, getter = isRunning) BOOL running;

- (void)start;
- (void)stop;
- (void)reset;
- (void)addLap;


@end
