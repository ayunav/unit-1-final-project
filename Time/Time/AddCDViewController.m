//
//  AddCDViewController.m
//  Time
//
//  Created by Christella on 9/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "AddCDViewController.h"
#import "Events.h"
#import "CDEvents.h"
#import "CDViewController.h"
#import "ShowCDViewController.h"


@interface AddCDViewController ()

@property (nonatomic)CDEvents * model;
@property (weak, nonatomic) IBOutlet UITableView *eventsView;



@end

@implementation AddCDViewController

//Delete Action
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.model.events removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Your Countdowns";
    
    self.model = [CDEvents sharedInstance];
    
    //    self.model = [[characterModel alloc]init];
    [self.model initializeEvents];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[ShowCDViewController class]]) {
        NSIndexPath * indexPath = [self.eventsView indexPathForSelectedRow];
        Events * countDownEvent = [self.model.events objectAtIndex:indexPath.row];
        NSString * name = countDownEvent.Eventname;
        
        
        ShowCDViewController *destination = segue.destinationViewController;
        destination.EventName = name;
       
        
        
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.model.events count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCellIdentifier" forIndexPath:indexPath];
    Events *CDEvent = [self.model.events objectAtIndex:indexPath.row];
    
    NSString *name = self.countdownTitle.text;
    
    
    cell.textLabel.text = name;
    
    
    return cell;
}





@end
