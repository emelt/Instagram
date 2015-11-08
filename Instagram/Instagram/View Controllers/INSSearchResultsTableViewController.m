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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.modelCellClass = [INSPhotoCell class];
    self.tableView.estimatedRowHeight = [UIScreen mainScreen].bounds.size.width;
}

#pragma mark - Setters

- (void)setSearchKeyword:(NSString *)searchKeyword
{
    if (!searchKeyword || searchKeyword == _searchKeyword)
    {
        return;
    }
    
    _searchKeyword = searchKeyword;
    self.nextMaxTagId = nil;
    
    [self.items removeAllObjects];
    [self.tableView reloadData];
    
    [self setLoading:YES];
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
