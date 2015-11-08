//
//  INSTableViewController.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSTableViewController.h"
#import "INSLoadingCell.h"
#import "INSModelCell.h"

@interface INSTableViewController ()

@property (nonatomic, strong) INSLoadingCell *loadingCell;

@end

@implementation INSTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.items removeAllObjects];
    self.loadingCell.loading = YES;
}

#pragma mark - Setters & Getters

- (NSMutableArray *)items
{
    if (!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (INSLoadingCell *)loadingCell
{
    if (!_loadingCell)
    {
        _loadingCell = [INSLoadingCell instance];
        _loadingCell.loading = YES;
    }
    
    return _loadingCell;
}

- (void)setLoading:(BOOL)loading
{
    if (loading == self.loadingCell.loading)
    {
        return;
    }
    
    self.loadingCell.loading = loading;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.items.count)
    {
        return self.loadingCell;
    }
    else
    {
        INSTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.modelCellClass)];
        
        if (!cell)
        {
            cell = [[self.modelCellClass alloc] initWithDefaults];
        }
        
        if (self.items.count > indexPath.row)
        {
            INSModel *modelItem = self.items[indexPath.row];
            if ([cell conformsToProtocol:@protocol(INSModelCell)]) {
                
                [(id <INSModelCell>)cell updateCellWithModel:modelItem];
            }
        }
        
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count + 1;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.items.count && self.loadingCell.loading)
    {
        [self getNextGroupOfItems];
    }
}


#pragma mark - Helpers

- (void)getNextGroupOfItems
{
    //must be implemented on subclasses
    //do not call super
}

- (void)loadingDidFinishWithItems:(NSArray *)newItems moreAvailable:(BOOL)moreAvailable
{
    if (newItems.count == 0 || !moreAvailable)
    {
        self.loadingCell.loading = NO;
        
        if (newItems.count == 0)
        {
            return;
        }
    }
    
    NSUInteger startIndex = self.items.count;
    
    [self.items addObjectsFromArray:newItems];
    
    NSArray *newIndexes = [self indexPathArrayStartingFromIndex:[NSIndexPath indexPathForRow:startIndex inSection:0]
                                                    numberOfIndexes:newItems.count];
    [self.tableView insertRowsAtIndexPaths:newIndexes withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSArray *)indexPathArrayStartingFromIndex:(NSIndexPath *)index numberOfIndexes:(NSInteger)numberOfIndexes
{
    NSMutableArray *newCellIndexes = [NSMutableArray array];
    
    for (NSUInteger idx = 0; idx < numberOfIndexes; idx++)
    {
        [newCellIndexes addObject:[NSIndexPath indexPathForRow:index.row+idx inSection:index.section]];
    }
    
    return newCellIndexes;
}

@end
