//
//  UIView+Autolayout.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "UIView+Autolayout.h"

static CGFloat const kDefaultMultiplier = 1.0f;

@interface UIView (INSHierarchy)

- (UIView *)commonAncestorWithView:(UIView *)paramView;

@end

@implementation UIView (INSHierarchy)

- (UIView *)commonAncestorWithView:(UIView *)paramView
{
    if (!self.superview ||
        !paramView.superview)
    {
        return nil;
    }
    else if (self == paramView ||
             self.superview == paramView.superview)
    {
        return self.superview;
    }
    
    UIView *superview = self.superview;
    while (superview)
    {
        if (paramView != superview && [paramView isDescendantOfView:superview])
        {
            return superview;
        }
        
        superview = superview.superview;
    }
    
    return nil;
}

@end

@implementation UIView (Autolayout)

- (NSLayoutConstraint *)constraintDistance:(CGFloat)paramDistance
                                    toView:(UIView *)paramView
                                        at:(INSLayoutConstraintLocation)paramLocation
{
    return [self constraintDistance:paramDistance
                             toView:paramView
                                 at:paramLocation
                           relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)constraintDistance:(CGFloat)paramDistance
                                    toView:(UIView *)paramView
                                        at:(INSLayoutConstraintLocation)paramLocation
                                  relation:(NSLayoutRelation)paramRelation
{
    NSLayoutConstraint *constraint = nil;
    
    switch (paramLocation) {
        case INSLayoutConstraintLocationTop: {
            
            constraint = [UIView addConstraintFromView:paramView
                                                toView:self
                                              distance:paramDistance
                                              relation:paramRelation
                                            isVertical:YES];
            break;
        }
        case INSLayoutConstraintLocationLeft: {
            
            constraint = [UIView addConstraintFromView:paramView
                                                toView:self
                                              distance:paramDistance
                                              relation:paramRelation
                                            isVertical:NO];
            break;
        }
        case INSLayoutConstraintLocationBottom: {
            
            constraint = [UIView addConstraintFromView:self
                                                toView:paramView
                                              distance:paramDistance
                                              relation:paramRelation
                                            isVertical:YES];
            break;
        }
        case INSLayoutConstraintLocationRight: {
            
            constraint = [UIView addConstraintFromView:self
                                                toView:paramView
                                              distance:paramDistance
                                              relation:paramRelation
                                            isVertical:NO];
            break;
        }
    }
    
    return constraint;
}

- (NSLayoutConstraint *)constraintDistanceToSuperview:(CGFloat)paramDistance
                                                   at:(INSLayoutConstraintLocation)paramLocation
{
    return [self constraintDistanceToSuperview:paramDistance
                                            at:paramLocation
                                      relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)constraintDistanceToSuperview:(CGFloat)paramDistance
                                                   at:(INSLayoutConstraintLocation)paramLocation
                                             relation:(NSLayoutRelation)paramRelation
{
    if (!self.superview)
    {
        return nil;
    }
    
    NSLayoutAttribute attribute;
    CGFloat constant = paramDistance;
    
    switch (paramLocation) {
        case INSLayoutConstraintLocationTop: {
            attribute = NSLayoutAttributeTop;
            break;
        }
        case INSLayoutConstraintLocationLeft: {
            attribute = NSLayoutAttributeLeading;
            break;
        }
        case INSLayoutConstraintLocationBottom: {
            attribute = NSLayoutAttributeBottom;
            constant = -constant;
            break;
        }
        case INSLayoutConstraintLocationRight: {
            attribute = NSLayoutAttributeTrailing;
            constant = -constant;
            break;
        }
    }
    
    NSLayoutConstraint *constraint =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:attribute
                                 relatedBy:paramRelation
                                    toItem:self.superview
                                 attribute:attribute
                                multiplier:kDefaultMultiplier
                                  constant:constant];
    
    [self.superview addConstraint:constraint];
    
    return constraint;
}

- (NSArray *)constraintDistancesToSuperviewToZero
{
    if (!self.superview)
    {
        return nil;
    }
    
    NSMutableArray *constraints = [NSMutableArray array];
    
    [constraints addObject:[self constraintDistanceToSuperview:0.f
                                                            at:INSLayoutConstraintLocationTop]];
    [constraints addObject:[self constraintDistanceToSuperview:0.f
                                                            at:INSLayoutConstraintLocationLeft]];
    [constraints addObject:[self constraintDistanceToSuperview:0.f
                                                            at:INSLayoutConstraintLocationBottom]];
    [constraints addObject:[self constraintDistanceToSuperview:0.f
                                                            at:INSLayoutConstraintLocationRight]];
    
    return [constraints copy];
}

- (NSLayoutConstraint *)constraintHorizontalAlignmentInSuperviewToCenter
{
    return [UIView addConstraintToCenterView:self isVertical:NO];
}

- (NSLayoutConstraint *)constraintVerticalAlignmentInSuperviewToCenter
{
    return [UIView addConstraintToCenterView:self isVertical:YES];
}

- (NSLayoutConstraint *)constraintHeight:(CGFloat)paramHeight
{
    return [self constraintHeight:paramHeight relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)constraintWidth:(CGFloat)paramWidth
{
    return [self constraintWidth:paramWidth relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)constraintHeight:(CGFloat)paramHeight
                                relation:(NSLayoutRelation)paramRelation
{
    return [UIView addSizeConstraintToView:self
                                      size:paramHeight
                                  relation:paramRelation
                                   isWidth:NO];
}

- (NSLayoutConstraint *)constraintWidth:(CGFloat)paramWidth relation:(NSLayoutRelation)paramRelation
{
    return [UIView addSizeConstraintToView:self
                                      size:paramWidth
                                  relation:paramRelation
                                   isWidth:YES];
}

- (NSLayoutConstraint *)constraintEqualWidthWithView:(UIView *)paramView
{
    return [self constraintEqualWidthWithView:paramView
                                       multiplier:kDefaultMultiplier];
}

- (NSLayoutConstraint *)constraintEqualWidthWithView:(UIView *)paramView
                                              multiplier:(CGFloat)paramMultiplier
{
    return [[self class] addConstraintEqualBetweenFirstView:self
                                                     secondView:paramView
                                                      attribute:NSLayoutAttributeWidth
                                                     multiplier:paramMultiplier];
}


- (NSLayoutConstraint *)constraintEqualHeightWithView:(UIView *)paramView
{
    return [self constraintEqualHeightWithView:paramView
                                        multiplier:kDefaultMultiplier];
}

- (NSLayoutConstraint *)constraintEqualHeightWithView:(UIView *)paramView
                                               multiplier:(CGFloat)paramMultiplier
{
    return [[self class] addConstraintEqualBetweenFirstView:self
                                                     secondView:paramView
                                                      attribute:NSLayoutAttributeHeight
                                                     multiplier:paramMultiplier];
}

- (NSLayoutConstraint *)constraintDistance:(CGFloat)paramDistance
                   toViewControllerLayoutGuide:(id<UILayoutSupport>)paramLayoutGuide
                                            at:(INSLayoutConstraintLocation)paramLocation
{
    return [self constraintDistance:paramDistance
            toViewControllerLayoutGuide:paramLayoutGuide
                                     at:paramLocation
                               relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)constraintDistance:(CGFloat)paramDistance
                   toViewControllerLayoutGuide:(id<UILayoutSupport>)paramLayoutGuide
                                            at:(INSLayoutConstraintLocation)paramLocation
                                      relation:(NSLayoutRelation)paramRelation
{
    if (paramLocation == INSLayoutConstraintLocationLeft ||
        paramLocation == INSLayoutConstraintLocationRight)
    {
        NSLog(@"View controller cannot have layout guides at left or right. Use INSLayoutConstraintLocationTop or INSLayoutConstraintLocationBottom.");
        return nil;
    }
    
    BOOL isTop = (paramLocation == INSLayoutConstraintLocationTop);
    id firstItem = nil;
    id secondItem = nil;
    
    if (isTop)
    {
        firstItem = self;
        secondItem = paramLayoutGuide;
    }
    else
    {
        firstItem = paramLayoutGuide;
        secondItem = self;
    }
    
    NSLayoutConstraint *constraint =
    [NSLayoutConstraint constraintWithItem:firstItem
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:paramRelation
                                    toItem:secondItem
                                 attribute:NSLayoutAttributeBottom
                                multiplier:kDefaultMultiplier
                                  constant:paramDistance];
    
    [[self superview] addConstraint:constraint];
    return constraint;
}

- (void)setTranslatesAutoresizingMaskIntoConstraintsOnAllSubviews:(BOOL)paramTranslates
{
    [self setTranslatesAutoresizingMaskIntoConstraints:paramTranslates onSubviews:self.subviews];
}

#pragma mark - Helpers

+ (NSLayoutConstraint *)addConstraintToCenterView:(UIView *)paramView
                                       isVertical:(BOOL)paramIsVertical
{
    if (!paramView.superview)
    {
        return nil;
    }
    
    NSLayoutAttribute attribute = paramIsVertical ? NSLayoutAttributeCenterY : NSLayoutAttributeCenterX;
    
    NSLayoutConstraint *constraint =
    [NSLayoutConstraint constraintWithItem:paramView
                                 attribute:attribute
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:paramView.superview
                                 attribute:attribute
                                multiplier:kDefaultMultiplier
                                  constant:0.f];
    
    [paramView.superview addConstraint:constraint];
    
    return constraint;
}

+ (NSLayoutConstraint *)addSizeConstraintToView:(UIView *)paramToView
                                           size:(CGFloat)paramSize
                                       relation:(NSLayoutRelation)paramRelation
                                        isWidth:(BOOL)paramIsWidth
{
    if (!paramToView)
    {
        return nil;
    }
    
    NSLayoutAttribute attribute = paramIsWidth ? NSLayoutAttributeWidth : NSLayoutAttributeHeight;
    
    NSLayoutConstraint *constraint =
    [NSLayoutConstraint constraintWithItem:paramToView
                                 attribute:attribute
                                 relatedBy:paramRelation
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:kDefaultMultiplier
                                  constant:paramSize];
    
    [paramToView addConstraint:constraint];
    
    return constraint;
}

+ (NSLayoutConstraint *)addConstraintFromView:(UIView *)paramFromView
                                       toView:(UIView *)paramToView
                                     distance:(CGFloat)paramDistance
                                     relation:(NSLayoutRelation)paramRelation
                                   isVertical:(BOOL)paramIsVertical
{
    UIView *commonAncestorView = [paramFromView commonAncestorWithView:paramToView];
    
    if (!commonAncestorView)
    {
        return nil;
    }
    
    NSLayoutAttribute fromAttribute = paramIsVertical ? NSLayoutAttributeBottom : NSLayoutAttributeTrailing;
    NSLayoutAttribute toAttribute = paramIsVertical ? NSLayoutAttributeTop : NSLayoutAttributeLeading;
    
    NSLayoutConstraint *constraint =
    [NSLayoutConstraint constraintWithItem:paramFromView
                                 attribute:fromAttribute
                                 relatedBy:paramRelation
                                    toItem:paramToView
                                 attribute:toAttribute
                                multiplier:kDefaultMultiplier
                                  constant:-paramDistance];
    
    [commonAncestorView addConstraint:constraint];
    
    return constraint;
}

+ (NSLayoutConstraint *)addConstraintEqualBetweenFirstView:(UIView *)paramFirstView
                                                    secondView:(UIView *)paramSecondView
                                                     attribute:(NSLayoutAttribute)paramAttribute
                                                    multiplier:(CGFloat)paramMultiplier
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:paramFirstView
                                                                  attribute:paramAttribute
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:paramSecondView
                                                                  attribute:paramAttribute
                                                                 multiplier:paramMultiplier
                                                                   constant:0];
    [paramFirstView.superview addConstraint:constraint];
    
    return constraint;
    
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)paramTranslates
                                          onSubviews:(NSArray*)paramArrayOfSubviews
{
    for (UIView *foundSubview in paramArrayOfSubviews)
    {
        if ([foundSubview subviews])
        {
            [self setTranslatesAutoresizingMaskIntoConstraints:paramTranslates
                                                    onSubviews:[foundSubview subviews]];
        }
        
        [foundSubview setTranslatesAutoresizingMaskIntoConstraints:paramTranslates];
    }
}

@end
