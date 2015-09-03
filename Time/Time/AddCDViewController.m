//
//  AddCDViewController.m
//  Time
//
//  Created by Christella on 9/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "AddCDViewController.h"
#import "CDEvents.h"
#import "CDViewController.h"
#import "ShowCDViewController.h"


@interface AddCDViewController () <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *eventsView;
@property (nonatomic) NSMutableArray *events;



@end

@implementation AddCDViewController

//Delete Action

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Your Countdowns";
    
    
   
    
    
}


#pragma mark Table View Methods 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.events.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.eventsView dequeueReusableCellWithIdentifier:@"TimerCellIdentifier" forIndexPath:indexPath];
    
    CDEvents *eventTemp;
    eventTemp = [self.events objectAtIndex:indexPath.row];
    
    cell.textLabel.text = eventTemp.countDownTitle;
    
    return cell;
}





@end
