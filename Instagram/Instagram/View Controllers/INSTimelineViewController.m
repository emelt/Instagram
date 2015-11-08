//
//  INSTimelineViewController.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSTimelineViewController.h"
#import "INSPhotosManager.h"
#import "INSPhotoCell.h"
#import "INSPhoto.h"

@interface INSTimelineViewController ()

@end

@implementation INSTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = NSLocalizedString(@"Popular", nil);

    self.modelCellClass = [INSPhotoCell class];
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
            
        }
        else
        {
            [self loadingDidFinishWithItems:photos moreAvailable:NO];
        }
    }];
}

@end
