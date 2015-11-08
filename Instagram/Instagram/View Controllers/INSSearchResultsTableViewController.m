//
//  INSSearchResultsTableViewController.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSSearchResultsTableViewController.h"
#import "INSPhotoCell.h"

@interface INSSearchResultsTableViewController ()

@end

@implementation INSSearchResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.modelCellClass = [INSPhotoCell class];
    self.tableView.estimatedRowHeight = [UIScreen mainScreen].bounds.size.width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)searchWithKeyword:(NSString *)keyword
{
    
}

@end
