//
//  INSLoadingCell.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSLoadingCell.h"

static CGFloat kINSLoadingCellHeight =  120.0f;
static CGFloat kINSActivityIndicatorWidth =  20.0f;

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
    [self.activityIndicator constraintWidth:kINSActivityIndicatorWidth];
    [self.activityIndicator constraintHeight:kINSActivityIndicatorWidth];
    [self.activityIndicator setColor:InstaBlueColor];
    
    [self.endOfDataLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.endOfDataLabel constraintHorizontalAlignmentInSuperviewToCenter];
    [self.endOfDataLabel constraintVerticalAlignmentInSuperviewToCenter];
    [self.endOfDataLabel setText:NSLocalizedString(@"End Of Contents", nil)];
    [self.endOfDataLabel setTextColor:InstaBlueColor];
    [self.endOfDataLabel setFont:[UIFont systemFontOfSize:15.0f weight:UIFontWeightLight]];
    
    self.separatorInset = UIEdgeInsetsMake(0.0f, [UIScreen mainScreen].bounds.size.width, 0.0f, 0.0f);

    [self addSubview:self.endOfDataLabel];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
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
    
    loading ? [self.activityIndicator startAnimating] : [self.activityIndicator stopAnimating];
}

@end
