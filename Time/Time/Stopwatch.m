//
//  Stopwatch.m
//  Time
//
//  Created by Christella on 8/29/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "Stopwatch.h"


@interface Stopwatch ()

@property (nonatomic, assign, readwrite) NSTimeInterval currentTime;
@property (nonatomic, assign, readwrite) NSTimeInterval currentLapTime;
@property (nonatomic, copy, readwrite) NSMutableArray *laps;
@property (nonatomic, strong) NSDate *currentLapStartTime;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *finishTime;
@property (nonatomic, assign, readwrite, getter = isRunning) BOOL running;

@end

@implementation Stopwatch

#pragma mark -

- (void)dealloc
{
    self.currentTime = 0;
    self.currentLapTime = 0;
    self.laps = [NSMutableArray array];
    self.running = NO;
    self.startTime = nil;
    self.finishTime = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _currentTime = 0;
        _currentLapTime = 0;
        _laps = [NSMutableArray array];
        _running = NO;
        _currentLapStartTime = nil;
        _startTime = nil;
        _finishTime = nil;
    }
    
    return self;
}

#pragma mark - Timer Management

- (void)start
{
    self.running = YES;
    self.startTime = [NSDate date];
}

- (void)stop
{
    self.running = NO;
    self.finishTime = [NSDate date];
}

- (void)reset
{
    self.currentTime = 0;
    [self.laps removeAllObjects];
    self.running = NO;
    self.startTime = nil;
    self.finishTime = nil;
}

#pragma mark - Current Time

- (NSTimeInterval)currentTime
{
    if (self.running)
    {
        return [[NSDate date] timeIntervalSinceDate:self.startTime];
    }
    
    return [self.finishTime timeIntervalSinceDate:self.startTime];
}

- (NSTimeInterval)currentLapTime
{
    if (self.running && self.laps.count > 0)
    {
        return [[NSDate date] timeIntervalSinceDate:self.currentLapStartTime];
    }
    
    return 0;
}

#pragma mark - Laps

- (void)addLap
{
    [self.laps addObject:@(self.currentTime)];
    self.currentLapStartTime = [NSDate date];
}

@end



