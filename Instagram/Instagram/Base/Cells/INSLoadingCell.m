//
//  INSLoadingCell.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSLoadingCell.h"

@interface INSLoadingCell ()

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) UILabel *endOfDataLabel;

@end

@implementation INSLoadingCell

+ (instancetype)instance
{
    INSLoadingCell *loadingCell = [[INSLoadingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [loadingCell setUpSubviews];
    return loadingCell;
}

- (void)setUpSubviews
{
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(20, 20, 10, 10)];
    
    [self addSubview:self.activityIndicator];
    
    self.endOfDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [self.endOfDataLabel setText:NSLocalizedString(@"End Of Contents", nil)];
    
    [self addSubview:self.endOfDataLabel];
}

- (void)setLoading:(BOOL)loading
{
    if (_loading == loading)
    {
        return;
    }
    
    _loading = loading;
    self.activityIndicator.hidden = !loading;
    self.endOfDataLabel.hidden = loading;
}

@end
