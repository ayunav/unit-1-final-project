//
//  SWViewController.m
//  Time
//
//  Created by Christella on 8/23/15.
//  Copyright (c) 2015 Christella Dolmo. All rights reserved.
//

#import "SWViewController.h"


@interface SWViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDate *startDate;

@property (nonatomic) NSTimeInterval totalSessionTime;
@property (nonatomic) NSTimeInterval totalTime;
@property (nonatomic, assign, readwrite) NSTimeInterval currentLapTime;
@property (weak, nonatomic) NSTimer *stopWatchTimer;

@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *lapResetButton;
@property (weak, nonatomic) IBOutlet UITableView *lapsTableView;
@property (strong,nonatomic)NSMutableArray *laps;
@property NSString *displayTime;

@end

@implementation SWViewController


-(NSTimer *) createTimer {
    
    self.startDate = [[NSDate alloc]init];
    
    return [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

-(void)updateTimer {
    
    //create date from the elapsed time
    NSDate *currentDate = [[NSDate alloc] init];
    
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.startDate];
    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    //create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"mm:ss.SS"];
    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    //format the elapsed time and set it to the label
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
   
    self.swLabel.text= timeString;
    
    self.totalSessionTime = [currentDate timeIntervalSinceDate:self.startDate];
    
    NSTimeInterval distance = self.totalTime + self.totalSessionTime;
    
    self.swLabel.text = [NSString stringWithFormat:@"%0.2f", distance];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.swLabel.text = @"00:00.00";
    
    [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
    
    [self.lapResetButton setTitle:@"Lap" forState:UIControlStateNormal];

    self.laps = [[NSMutableArray alloc] init];
    
    
}

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
    
    
  
   
    if ( ! self.stopWatchTimer){
        self.stopWatchTimer = [self createTimer];
        
        
        [self.startStopButton setTitle:@"Stop" forState:UIControlStateNormal];

        

    }  else  {
       
        
        self.totalTime = self.totalTime + self.totalSessionTime;

        [self.stopWatchTimer invalidate];
        
        [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
        
        [self.startStopButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];

        [self.lapResetButton setTitle:@"Reset" forState:UIControlStateNormal];
    
}
    
    
}

- (IBAction)lapResetButtonAction:(id)sender {
    
    if(self.stopWatchTimer){
        
        [self.lapResetButton setTitle:@"Lap" forState:UIControlStateNormal];
        
        self.displayTime = self.swLabel.text;
        
        [self.laps addObject: self.displayTime];
        
        [self.lapsTableView reloadData];
        
        return   NSLog(@"%@",self.displayTime);
        
    }
    
    
    if(!self.stopWatchTimer) {
        
        
        [self.stopWatchTimer invalidate];
        
        self.laps = [[NSMutableArray alloc] init];
        
        [self.lapsTableView reloadData];
        
        self.swLabel.text=[NSString stringWithFormat :@"00:00.0"];
        
    }
}

@end
