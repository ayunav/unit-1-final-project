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




@end
