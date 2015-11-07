//
//  INSTimelineViewController.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSTimelineViewController.h"
#import "INSPhotosManager.h"
#import "INSLoadingCell.h"
#import "INSPhotoCell.h"
#import "INSPhoto.h"

@interface INSTimelineViewController ()

@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) INSLoadingCell *loadingCell;

@end

@implementation INSTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = NSLocalizedString(@"Available photos", nil);
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
    
    self.loadingCell = [INSLoadingCell instance];
    self.loadingCell.loading = YES;
}

#pragma mark - Setters & Getters

- (NSMutableArray *)photos
{
    if (!_photos)
    {
        _photos = [NSMutableArray array];
    }
    return _photos;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self performSegueWithIdentifier:kETShowMatchDetailsSegueIdentifier sender:self];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.photos.count)
    {
        return self.loadingCell;
    }
    else
    {
        INSPhotoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[INSPhotoCell reuseIdentifier]];
        
        if (!cell)
        {
            cell = [[INSPhotoCell alloc] initWithDefaults];
        }
        
        if (self.photos.count > indexPath.row)
        {
            INSPhoto *photo = self.photos[indexPath.row];
            [cell updateWithPhoto:photo];
        }
        
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.photos.count + 1;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.photos.count && self.loadingCell.loading)
    {
        [self getPhotosStartingFromIndex:self.photos.count];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

#pragma mark - Helpers

- (void)getPhotosStartingFromIndex:(NSInteger)startIndex
{
    __weak typeof(self) weakSelf = self;
    
    [[INSPhotosManager sharedInstance] getPopularPhotosWithCompletion:^(NSError *error, NSArray *photos){
        if (error)
        {

        }
        else
        {
            if (photos.count == 0)
            {
                self.loadingCell.loading = NO;
                return;
            }
            
            [weakSelf.photos addObjectsFromArray:photos];
            NSArray *newIndexes = [weakSelf indexPathArrayStartingFromIndex:[NSIndexPath indexPathForRow:startIndex inSection:0]
                                                            numberOfIndexes:photos.count];
            [weakSelf.tableView insertRowsAtIndexPaths:newIndexes withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }];
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
