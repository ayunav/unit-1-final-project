//
//  SWViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Christella Dolmo. All rights reserved.
//

#import "SWViewController.h"
#import "Format.h"

@interface SWViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDate *startDate;

@property (nonatomic) NSTimeInterval totalSessionTime;
@property (nonatomic) NSTimeInterval totalTime;
@property (nonatomic, assign, readwrite) NSTimeInterval currentLapTime;

@property (strong,nonatomic)NSMutableArray *laps;


@property (weak, nonatomic) IBOutlet UITableView *lapsTableView;

@property (strong, nonatomic) NSTimer *stopWatchTimer;

@end

@implementation SWViewController


-(NSTimer *) createTimer {
    
    self.startDate = [[NSDate alloc]init];
    
    //create the stop watch timer that fires every 100 ms
  return  self.stopWatchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

-(void)updateTimer {
    
    //create date from the elapsed time
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    //create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    //formtat the elapsed time and set it to the label
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    self.swLabel.text= timeString;
    
    self.totalSessionTime = [currentDate timeIntervalSinceDate:self.startDate];
    NSTimeInterval distance = self.totalTime + self.totalSessionTime;
    
    self.swLabel.text = [NSString stringWithFormat:@"%0.2f", distance];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swLabel.text = @"00:00:00.000";
    
    self.laps = [[NSMutableArray alloc] init];
    
}

//set number of rows

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.laps count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *SimpleIdentifier = @"SimpleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
    }
    cell.textLabel.text = self.laps[indexPath.row];
    return cell;
}


#pragma mark - Buttons!

- (IBAction)startStopButtonAction:(id)sender {
    
    
    if (! self.stopWatchTimer){
        
        //create timer object that fires off every 0.01th of a second
       self.stopWatchTimer = [self createTimer];
        
        
        
        
        
        
    } else {
        
        [self.stopWatchTimer invalidate];
        
        UIImage *startImageGreen = [UIImage imageNamed:@"fe_runningStart.png"];
        [_startStopButton setImage:startImageGreen  forState:UIControlStateNormal];
        
        UIImage *stopImageRed  = [UIImage imageNamed:@"fe_runningStop.png"];
        [_startStopButton setImage:stopImageRed forState:UIControlStateNormal];
        
        
        UIImage *restartImageGreen = [UIImage imageNamed:@"fe_runningStart.png"];
        [_startStopButton  setImage:restartImageGreen forState:UIControlStateNormal];
        
        
        UIImage *resetImageBlue = [UIImage imageNamed:@"fe_runningReset.png"];
        [_lapResetButton setImage:resetImageBlue forState:UIControlStateNormal];
    }
    
    
}










@end
