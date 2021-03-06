//
//  CQPresetTimerViewController.m
//  Time
//
//  Created by Ayuna Vogel on 8/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "CQPresetTimerViewController.h"
#import "TimerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface CQPresetTimerViewController () 

@property (nonatomic) AVAudioPlayer *soundAlarmTimerIsUp;

@property (nonatomic) NSTimer *timer;

@property (nonatomic) int secondsCount;
@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@property (nonatomic) BOOL isTimerRunning;
@property (nonatomic) BOOL isTimerPaused;

@property (nonatomic) NSTimeInterval timerDuration;

@property (weak, nonatomic) IBOutlet UIButton *startCancelButtonTapped;
@property (weak, nonatomic) IBOutlet UIButton *pauseResumeButtonTapped;

@end

@implementation CQPresetTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pauseResumeButtonTapped.enabled = NO;
    self.timerPickerView.hidden = YES;
  
    self.timerTitleLabel.text = self.timerObject.timerTitle;

    self.hours = self.timerObject.timerDuration/3600;
    self.minutes = fmod(self.timerObject.timerDuration, 3600) / 60;
    self.seconds = self.timerObject.timerDuration - (self.hours * 3600) - (self.minutes * 60);
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", self.hours, self.minutes, self.seconds];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)timerFired: (NSTimer *)timer {
    
    self.secondsCount--;
    
    self.hours = self.secondsCount/3600;
    self.minutes = (self.secondsCount % 3600)/60;
    self.seconds = self.secondsCount - (self.hours * 3600) - (self.minutes * 60);
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", self.hours, self.minutes, self.seconds];
    self.timerLabel.hidden = NO;
    self.timerPickerView.hidden = YES;
    
    if (self.secondsCount <= 0) {
        
        [self.timer invalidate];
        self.timer = nil;
        
        self.soundAlarmTimerIsUp = [[AVAudioPlayer alloc] initWithContentsOfURL:self.timerObject.soundURL error:nil];
        [self.soundAlarmTimerIsUp play];
        
        [self.startCancelButtonTapped setTitle:@"Start" forState:UIControlStateNormal];
        self.pauseResumeButtonTapped.enabled = NO;
        
        // adds vibration when the timer is up
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}

- (IBAction)startCancelButtonTapped:(id)sender {
    self.timerDuration = self.timerObject.timerDuration;
    
    self.hours = (int)(self.timerDuration/3600.0f);
    self.minutes = ((int)self.timerDuration - (self.hours * 3600))/60;
    self.seconds = self.timerDuration - (self.hours * 3600) - (self.minutes * 60);
    
    self.secondsCount = self.timerDuration;
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", self.hours, self.minutes, self.seconds];
    
    if (self.isTimerRunning == YES) {
        
        [self.startCancelButtonTapped setTitle:@"Start" forState:UIControlStateNormal];
        [self.pauseResumeButtonTapped setTitle:@"Pause" forState:UIControlStateNormal];
        self.pauseResumeButtonTapped.enabled = NO;
        
        [self.timer invalidate];
        self.timer = nil;
        self.secondsCount = -1;
        
    } else {
        
        [self.startCancelButtonTapped setTitle:@"Cancel" forState:UIControlStateNormal];
        self.pauseResumeButtonTapped.enabled = YES;
        
        if (self.timer == nil) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
        }
    }
    
    self.isTimerRunning = !self.isTimerRunning;
}

- (IBAction)pauseResumeButtonTapped:(id)sender {
    if (self.isTimerPaused == NO) {
        [self.timer invalidate];
        self.timer = nil;
        
        [self.pauseResumeButtonTapped setTitle:@"Resume" forState:UIControlStateNormal];
        
    } else {
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
        [self.pauseResumeButtonTapped setTitle:@"Pause" forState:UIControlStateNormal];
    }
    
    self.isTimerPaused = !self.isTimerPaused;
}


@end
