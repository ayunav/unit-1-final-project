//
//  CQNewTimerViewController.m
//  Time
//
//  Created by Ayuna Vogel on 8/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "CQNewTimerViewController.h"
#import "CQTimer.h"
#import "TimerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CQNewTimerViewController ()

@property (nonatomic) NSTimer *timer;

@property (nonatomic) int secondsCount;
@property (nonatomic) int hours;
@property (nonatomic) int minutes;
@property (nonatomic) int seconds;

@property (nonatomic) BOOL isTimerRunning;
@property (nonatomic) BOOL isTimerPaused;

@property (weak, nonatomic) IBOutlet UIDatePicker *timerPickerView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startCancelButtonTapped;
@property (weak, nonatomic) IBOutlet UIButton *pauseResumeButtonTapped;
@property (weak, nonatomic) IBOutlet UITextField *timerTitleTextField;

// Sounds
@property (weak, nonatomic) IBOutlet UIPickerView *soundPickerView;
@property (nonatomic) AVAudioPlayer *soundAlarmTimerIsUp;
@property (nonatomic) NSString *soundName;
@property (nonatomic) NSArray *sounds;
@property (nonatomic) AVAudioPlayer *soundAtRowSelected;

@end

@implementation CQNewTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"New Timer";

    NSInteger seconds = 60;
    [self.timerPickerView setDatePickerMode:UIDatePickerModeCountDownTimer];
    [self.timerPickerView setCountDownDuration:seconds];
    
    self.sounds = [[NSMutableArray alloc]initWithObjects:@"Radar", @"Sonar", @"Zombies", @"Tornado Siren", @"Rocket Launch", @"Most Annoying Sound", @"Magical Explosion", @"Dramatic", @"Kitchen Timer", @"Futuristic Alarm", @"Just Alarm", nil];
    self.soundName = [self.sounds objectAtIndex:0];
    
    self.timerLabel.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Button methods 

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
        
        // Code below is added to work with audio files
        // Construct URL to sound file
        NSString *path = [NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath], self.soundName];
        NSURL *soundURL = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        self.soundAlarmTimerIsUp = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
        [self.soundAlarmTimerIsUp play];
        
        [self.startCancelButtonTapped setTitle:@"Start" forState:UIControlStateNormal];
        self.pauseResumeButtonTapped.enabled = NO;
    }
}

- (IBAction)startCancelButtonTapped:(id)sender {
    self.timerDuration = self.timerPickerView.countDownDuration;
    
    self.seconds = 0;
    self.hours = (int)(self.timerDuration/3600.0f);
    self.minutes = ((int)self.timerDuration - (self.hours * 3600))/60;
    
    self.secondsCount = ((self.hours * 3600) + (self.minutes * 60));
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", self.hours, self.minutes, self.seconds];
    
    if (self.isTimerRunning == YES) {
        
        [self.startCancelButtonTapped setTitle:@"Start" forState:UIControlStateNormal];
        [self.pauseResumeButtonTapped setTitle:@"Pause" forState:UIControlStateNormal];
        self.pauseResumeButtonTapped.enabled = NO;
        self.timerLabel.hidden = YES;
        self.timerPickerView.hidden = NO;
        
        [self.timer invalidate];
        self.timer = nil;
        
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

#pragma mark - Save new Timer ButtonTapped method
// The delegate method below is used to push new VC and pass data to it programmatically. When new VC is pushed in the storyboard through segue action, the method below should be implemented via prepareForSegue method. We don't need prepareForSegue method if we do it programmatically as below.
- (IBAction)saveButtonTapped:(id)sender {
    
    CQTimer *newTimer = [[CQTimer alloc] init];
    newTimer.timerTitle = self.timerTitleTextField.text;
    newTimer.timerDuration = self.timerPickerView.countDownDuration;
    newTimer.soundName = self.soundName;
    NSString *path = [NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath], self.soundName];
    newTimer.soundURL = [NSURL fileURLWithPath:path];
    
    [self.delegate addToTheArrayNewTimer:newTimer];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - soundPickerView methods

// Number of columns in the soundPickerView (one).
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// Number of rows (choices) in the soundPickerView (as many as there are sound alarm choices).
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.sounds.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [self.sounds objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    self.soundName = [self.sounds objectAtIndex:row];
    
    NSString *path = [NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath], self.soundName];
    NSURL *soundURL = [NSURL fileURLWithPath:path];
    
    self.soundAtRowSelected = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    [self.soundAtRowSelected play];
}

@end
