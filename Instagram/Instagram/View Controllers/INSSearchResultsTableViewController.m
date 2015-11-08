//
//  INSSearchResultsTableViewController.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSSearchResultsTableViewController.h"
#import "INSPhotosManager.h"
#import "INSPhotoCell.h"

@interface INSSearchResultsTableViewController ()

@property (strong, nonatomic) NSString *nextMaxTagId;

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

#pragma mark - Setters

- (void)setSearchKeyword:(NSString *)searchKeyword
{
    if (!searchKeyword || searchKeyword.length == 0 || searchKeyword == _searchKeyword)
    {
        return;
    }
    
    _searchKeyword = searchKeyword;
    
    [self.tableView reloadData];
}

#pragma mark - INSTableViewController Methods

- (void)getNextGroupOfItems
{
    __weak typeof(self) weakSelf = self;
    
    if (self.searchKeyword.length > 0)
    {
        [[INSPhotosManager sharedInstance] getPhotosWithKeyword:self.searchKeyword maxTagId:self.nextMaxTagId completion:^(NSError *error, NSArray<INSPhoto *> *photos, NSString *nextMaxTagId) {
            if (error)
            {
                //handle error
            }
            else
            {
                weakSelf.nextMaxTagId = nextMaxTagId;
                [weakSelf loadingDidFinishWithItems:photos moreAvailable:nextMaxTagId.length > 0];
            }
        }];
    }

}

@end
