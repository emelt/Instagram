//
//  INSPhotoCell.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSPhotoCell.h"
#import "INSPhoto.h"

static CGFloat kINSOwnerPhotoEdge = 50.0f;

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
    [_ownerNameLabel constraintDistanceToSuperview:kINSDefaultMargin at:INSLayoutConstraintLocationTop];
    
    [_timeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_timeLabel constraintDistance:kINSDefaultMargin toView:self.contentView at:INSLayoutConstraintLocationRight];
    [_timeLabel constraintDistanceToSuperview:kINSDefaultMargin at:INSLayoutConstraintLocationTop];
    
    [_image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_image constraintDistanceToSuperview:0.0f at:INSLayoutConstraintLocationRight];
    [_image constraintDistanceToSuperview:0.0f at:INSLayoutConstraintLocationLeft];
    [_image constraintDistance:kINSDefaultMargin toView:_ownerPhoto at:INSLayoutConstraintLocationTop];
    _imageHeightConstraint = [_image constraintHeight:[UIScreen mainScreen].bounds.size.width];
    
    [_likesAndCommentsLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_likesAndCommentsLabel constraintDistance:kINSDefaultMargin toView:_image at:INSLayoutConstraintLocationTop];
    [_likesAndCommentsLabel constraintDistanceToSuperview:kINSDefaultMargin at:INSLayoutConstraintLocationBottom];
    [_likesAndCommentsLabel constraintHorizontalAlignmentInSuperviewToCenter];
    
    self.clipsToBounds = YES;
}

- (void)updateCellWithModel:(INSModel *)model
{
    if ([model isKindOfClass:[INSPhoto class]])
    {
        self.photo = (INSPhoto *)model;
        
        [self.ownerPhoto setImageWithURL:[NSURL URLWithString:self.photo.owner.profilePhotoUrl]];
        [self.image setImageWithURL:[NSURL URLWithString:self.photo.lowResolution.url]];
        
        self.imageHeightConstraint.constant = self.photo.lowResolution.height / self.photo.lowResolution.width * self.contentView.frame.size.width;
        self.ownerNameLabel.text = self.photo.owner.nickname;
        
        self.likesAndCommentsLabel.text = [NSString stringWithFormat:@"%lu likes, %lu comments", self.photo.likeCount, (unsigned long)self.photo.commentCount];
    }
}

@end
