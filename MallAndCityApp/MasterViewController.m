//
//  MasterViewController.m
//  MallAndCityApp
//
//  Created by Admin on 2018/11/28.
//  Copyright © 2018 Johan Vorster. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <MallCitySDK/MallAndCityHttp.h>
#import <MallCitySDK/MallAndCityUtil.h>
@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController
MallAndCityUtil* util;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    MallAndCityHttp* httpRequest = [[MallAndCityHttp alloc] init];
    util = [[MallAndCityUtil alloc] init];
    [util setData:[httpRequest request:@"http://www.mocky.io/v2/5b7e8bc03000005c0084c210"]];
    
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    int i=0;
    for (NSMutableArray *city in [util getCities:nil]) {
        [self.objects insertObject:city atIndex:i];
        i++;
    }
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
