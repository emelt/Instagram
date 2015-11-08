//
//  INSLoadingCell.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSLoadingCell.h"

static CGFloat kINSLoadingCellHeight =  120.0f;

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
    [self.contentView constraintHeight:kINSLoadingCellHeight];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] init];
    self.endOfDataLabel = [[UILabel alloc] init];

    [self addSubview:self.activityIndicator];
    [self addSubview:self.endOfDataLabel];
    
    [self.activityIndicator setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.activityIndicator constraintHorizontalAlignmentInSuperviewToCenter];
    [self.activityIndicator constraintVerticalAlignmentInSuperviewToCenter];
    
    [self.endOfDataLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.endOfDataLabel constraintHorizontalAlignmentInSuperviewToCenter];
    [self.endOfDataLabel constraintVerticalAlignmentInSuperviewToCenter];
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
