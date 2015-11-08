//
//  INSPhotoCell.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSPhotoCell.h"
#import "INSPhoto.h"

static CGFloat kINSOwnerPhotoEdge = 40.0f;

@interface INSPhotoCell ()

@property (strong, nonatomic) INSPhoto *photo;
@property (strong, nonatomic) UIImageView *ownerPhoto;
@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) UILabel *ownerNameLabel;
@property (strong, nonatomic) UILabel *likesAndCommentsLabel;
@property (strong, nonatomic) UILabel *timeLabel;

@property (strong, nonatomic) NSLayoutConstraint *imageHeightConstraint;
@property (strong, nonatomic) NSLayoutConstraint *imageWidthConstraint;

@end

@implementation INSPhotoCell

- (instancetype)initWithDefaults
{
    self = [super initWithDefaults];
    
    if (self)
    {
        [self addSubviews];
    }
    
    return self;
}

- (void)addSubviews
{
    _likesAndCommentsLabel = [[UILabel alloc] init];
    _ownerNameLabel = [[UILabel alloc] init];
    _image = [[UIImageView alloc] init];
    _ownerPhoto = [[UIImageView alloc] init];
    _timeLabel = [[UILabel alloc] init];
    
    [self.contentView addSubview:_likesAndCommentsLabel];
    [self.contentView addSubview:_ownerNameLabel];
    [self.contentView addSubview:_ownerPhoto];
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_image];
    
    [_ownerPhoto setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_ownerPhoto constraintDistanceToSuperview:kINSDefaultMargin at:INSLayoutConstraintLocationLeft];
    [_ownerPhoto constraintDistanceToSuperview:kINSDefaultMargin at:INSLayoutConstraintLocationTop];
    [_ownerPhoto constraintWidth:kINSOwnerPhotoEdge];
    [_ownerPhoto constraintHeight:kINSOwnerPhotoEdge];
    _ownerPhoto.layer.cornerRadius = kINSOwnerPhotoEdge / 2;
    _ownerPhoto.clipsToBounds = YES;
    
    [_ownerNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_ownerNameLabel constraintDistance:kINSDefaultMargin toView:_ownerPhoto at:INSLayoutConstraintLocationLeft];
    [_ownerNameLabel constraintDistanceToSuperview:kINSDefaultMargin + kINSOwnerPhotoEdge/2  at:INSLayoutConstraintLocationTop];
    [_ownerNameLabel setTextColor:InstaBlueColor];
    [_ownerNameLabel setFont:[UIFont systemFontOfSize:15.0f weight:UIFontWeightSemibold]];
    
    [_timeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_timeLabel constraintDistanceToSuperview:kINSDefaultMargin at:INSLayoutConstraintLocationRight];
    [_timeLabel constraintDistanceToSuperview:kINSDefaultMargin + kINSOwnerPhotoEdge/2 at:INSLayoutConstraintLocationTop];
    [_timeLabel setTextAlignment: NSTextAlignmentRight];
    [_timeLabel setTextColor:[UIColor lightGrayColor]];
    [_timeLabel setFont:[UIFont systemFontOfSize:15.0f weight:UIFontWeightLight]];
    
    [_image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_image constraintDistanceToSuperview:0.0f at:INSLayoutConstraintLocationRight];
    [_image constraintDistanceToSuperview:0.0f at:INSLayoutConstraintLocationLeft];
    [_image constraintDistance:kINSDefaultMargin toView:_ownerPhoto at:INSLayoutConstraintLocationTop];
    _imageHeightConstraint = [_image constraintHeight:[UIScreen mainScreen].bounds.size.width];
    
    [_likesAndCommentsLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_likesAndCommentsLabel constraintDistance:kINSDefaultMargin toView:_image at:INSLayoutConstraintLocationTop];
    [_likesAndCommentsLabel constraintDistanceToSuperview:kINSDefaultMargin at:INSLayoutConstraintLocationBottom relation:NSLayoutRelationLessThanOrEqual];
    [_likesAndCommentsLabel constraintHorizontalAlignmentInSuperviewToCenter];
    [_likesAndCommentsLabel setTextColor:[UIColor lightGrayColor]];
    [_likesAndCommentsLabel setFont:[UIFont systemFontOfSize:15.0f weight:UIFontWeightMedium]];
    
}

- (void)updateCellWithModel:(INSModel *)model
{
    if ([model isKindOfClass:[INSPhoto class]])
    {
        self.photo = (INSPhoto *)model;
        
        [self.ownerPhoto setImageWithURL:[NSURL URLWithString:self.photo.owner.profilePhotoUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        [self.image setImageWithURL:[NSURL URLWithString:self.photo.lowResolution.url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        self.imageHeightConstraint.constant = self.photo.lowResolution.height / self.photo.lowResolution.width * self.contentView.frame.size.width;
        self.ownerNameLabel.text = self.photo.owner.nickname;
        self.timeLabel.text = [self getTimeDifferenceForDate];
        self.likesAndCommentsLabel.text = [NSString stringWithFormat:NSLocalizedString(@"❤ %lu \t\t 💬 %lu", nil), self.photo.likeCount, (unsigned long)self.photo.commentCount];
    }
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    [self.ownerPhoto setImage:nil];
    [self.image setImage:nil];
}

#pragma mark - Helpers

- (NSString *)getTimeDifferenceForDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *current = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour|NSCalendarUnitDay|NSCalendarUnitMinute fromDate:self.photo.time toDate:current options:0];
    
    if (components.day > 0)
    {
        return [NSString stringWithFormat:NSLocalizedString(@"%dd", nil), components.day];
    }
    else if (components.hour > 0)
    {
        return [NSString stringWithFormat:NSLocalizedString(@"%dh", nil), components.hour];
    }
    else if (components.minute > 0)
    {
        return [NSString stringWithFormat:NSLocalizedString(@"%dm", nil), components.minute];
    }
    
    return @"";
}

@end
