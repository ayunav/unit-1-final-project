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


@interface AddCDViewController ()<NewEventDelegate>


@property (weak, nonatomic) IBOutlet UITableView *eventsView;
@property (nonatomic) NSMutableArray *userEvents;



@end

@implementation AddCDViewController

//Delete Action

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Your Countdowns";
    self.userEvents = [[NSMutableArray alloc] init];
    
}


#pragma mark Table View Methods 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.userEvents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.eventsView dequeueReusableCellWithIdentifier:@"eventCellIdentifier" forIndexPath:indexPath];
    
    CDEvents *eventTemp;
    eventTemp = [self.userEvents objectAtIndex:indexPath.row];
    
    cell.textLabel.text = eventTemp.userEventTitle;
    
    return cell;
}


#pragma mark New Event Button

- (IBAction)newEvent:(UIBarButtonItem *)sender {
    
    
    if([sender.title isEqualToString:@"New Event"]){
        
        CDViewController *newEventVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NewEventViewController"];
        newEventVC.delegate = self;
        [self.navigationController pushViewController:newEventVC animated:YES];
    }
    
}

#pragma mark - Delegate methods

- (void) addToTheArrayNewEvent:(CDEvents *)newEvent {
    [self.userEvents addObject:newEvent];
    [self.eventsView reloadData];
}


#pragma mark - didSelectRowAtIndexPath

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShowCDViewController *cdEventsVC= [self.storyboard instantiateViewControllerWithIdentifier:@"CDEventsViewController"];
    
    CDEvents *eventObject = self.userEvents[indexPath.row];
    
    //pass the CQTimer timerObject to the next VC
    cdEventsVC.eventObject = eventObject;
    
    [self.navigationController pushViewController:cdEventsVC animated:YES];
}





@end
