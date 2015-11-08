//
//  INSTimelineViewController.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSSearchResultsTableViewController.h"
#import "INSTimelineViewController.h"
#import "INSPhotosManager.h"
#import "INSPhotoCell.h"
#import "INSPhoto.h"

static CGFloat kINSSearchDelayDuration = 1.0f;

@interface INSTimelineViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) INSSearchResultsTableViewController *resultsController;
@property (strong, nonatomic) NSTimer *searchTimer;

@end

@implementation INSTimelineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = NSLocalizedString(@"Popular", nil);

    self.resultsController = [[INSSearchResultsTableViewController alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsController];
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    
    self.searchController.searchBar.delegate = self;
    self.searchController.delegate = self;
    
    self.definesPresentationContext = YES;
    
    self.modelCellClass = [INSPhotoCell class];
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.tableView.estimatedRowHeight = [UIScreen mainScreen].bounds.size.width;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

#pragma mark - INSTableViewController Methods

- (void)getNextGroupOfItems
{
    __weak typeof(self) weakSelf = self;
    
    [[INSPhotosManager sharedInstance] getPopularPhotosWithCompletion:^(NSError *error, NSArray *photos){
        if (error)
        {
            [weakSelf showAlertWithTitle:NSLocalizedString(@"Error", nil) message:error.localizedDescription];
        }
        else
        {
            [weakSelf loadingDidFinishWithItems:photos moreAvailable:NO];
        }
    }];
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    if (self.searchTimer)
    {
        [self.searchTimer invalidate];
        self.searchTimer = nil;
    }

        self.searchTimer = [NSTimer scheduledTimerWithTimeInterval:kINSSearchDelayDuration target:self selector:@selector(updateSearchResults) userInfo:nil repeats:NO];
}

- (void)updateSearchResults
{
    self.resultsController.searchKeyword = self.searchController.searchBar.text;
}

@end
