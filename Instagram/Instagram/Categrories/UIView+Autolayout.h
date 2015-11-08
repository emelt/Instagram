//
//  UIView+Autolayout.h
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

/**
 Location of the layout constraint.
 */
typedef NS_ENUM(NSUInteger, INSLayoutConstraintLocation) {
    INSLayoutConstraintLocationTop,
    INSLayoutConstraintLocationLeft,
    INSLayoutConstraintLocationBottom,
    INSLayoutConstraintLocationRight
};

#import <UIKit/UIKit.h>

@interface UIView (Autolayout)

/**
 Constraints distance to another view at any location.
 @param paramDistance Distance.
 @param paramView View to set distance with.
 @param paramLocation Location of view to-view.
 */
- (NSLayoutConstraint *)constraintDistance:(CGFloat)paramDistance
                                    toView:(UIView *)paramView
                                        at:(INSLayoutConstraintLocation)paramLocation;

/**
 Constraints distance to another view at any location.
 @param paramDistance Distance.
 @param paramView View to set distance with.
 @param paramLocation Location of view to-view.
 @param paramRelation Relation for distance.
 */
- (NSLayoutConstraint *)constraintDistance:(CGFloat)paramDistance
                                    toView:(UIView *)paramView
                                        at:(INSLayoutConstraintLocation)paramLocation
                                  relation:(NSLayoutRelation)paramRelation;

/**
 Constraints distance with superview.
 @param paramDistance Distance.
 @param paramLocation Location of self to set distance with superview.
 */
- (NSLayoutConstraint *)constraintDistanceToSuperview:(CGFloat)paramDistance
                                                   at:(INSLayoutConstraintLocation)paramLocation;
/**
 Constraints distance with superview.
 @param paramDistance Distance.
 @param paramLocation Location of self to set distance with superview.
 @param paramRelation Relation for distance.
 */
- (NSLayoutConstraint *)constraintDistanceToSuperview:(CGFloat)paramDistance
                                                   at:(INSLayoutConstraintLocation)paramLocation
                                             relation:(NSLayoutRelation)paramRelation;

/**
 Constraints top, left, bottom and right distances with superview.
 @return Constraints added. [top, left, bottom, right]
 */
- (NSArray *)constraintDistancesToSuperviewToZero;

/**
 Constraints horizontal alignment of the view to center.
 */
- (NSLayoutConstraint *)constraintHorizontalAlignmentInSuperviewToCenter;

/**
 Constraints vertical alignment of the view to center.
 */
- (NSLayoutConstraint *)constraintVerticalAlignmentInSuperviewToCenter;

/**
 Constraints height of the view.
 @param paramHeight Height.
 */
- (NSLayoutConstraint *)constraintHeight:(CGFloat)paramHeight;

/**
 Constraints width of the view.
 @param paramWidth Width.
 */
- (NSLayoutConstraint *)constraintWidth:(CGFloat)paramWidth;

/**
 Constraints height of the view.
 @param paramHeight Height.
 @param paramRelation Relation for height.
 */
- (NSLayoutConstraint *)constraintHeight:(CGFloat)paramHeight relation:(NSLayoutRelation)paramRelation;

/**
 Constraints width of the view.
 @param paramWidth Width.
 @param paramRelation Relation for width.
 */
- (NSLayoutConstraint *)constraintWidth:(CGFloat)paramWidth relation:(NSLayoutRelation)paramRelation;

/**
 Constraints equal width with the given view.
 @param paramView View to be linked equal width with.
 
 @return Newly created layout constraint.
 */
- (NSLayoutConstraint *)constraintEqualWidthWithView:(UIView *)paramView;

/**
 Constraints equal width with the given view.
 @param paramView View to be linked equal width with.
 @param paramMultiplier Multiplier to be used.
 
 @return Newly created layout constraint.
 */
- (NSLayoutConstraint *)constraintEqualWidthWithView:(UIView *)paramView
                                              multiplier:(CGFloat)paramMultiplier;

/**
 Constraints equal height with the given view.
 @param paramView View to be linked equal height with.
 
 @return Newly created layout constraint.
 */
- (NSLayoutConstraint *)constraintEqualHeightWithView:(UIView *)paramView;

/**
 Constraints equal height with the given view.
 @param paramView View to be linked equal height with.
 @param paramMultiplier Multiplier to be used.
 
 @return Newly created layout constraint.
 */
- (NSLayoutConstraint *)constraintEqualHeightWithView:(UIView *)paramView
                                               multiplier:(CGFloat)paramMultiplier;

/**
 Constraints distance to top layout guide.
 @param paramDistance Distance.
 @param paramLayoutGuide Layout guide to add constraint to.
 @param paramLocation Location of layout guide in respect to the view.
 */
- (NSLayoutConstraint *)constraintDistance:(CGFloat)paramDistance
                   toViewControllerLayoutGuide:(id<UILayoutSupport>)paramLayoutGuide
                                            at:(INSLayoutConstraintLocation)paramLocation;

/**
 Constraints distance to top layout guide.
 @param paramDistance Distance.
 @param paramLayoutGuide Layout guide to add constraint to.
 @param paramLocation Location of layout guide in respect to the view.
 @param paramRelation Relation for distance.
 */
- (NSLayoutConstraint *)constraintDistance:(CGFloat)paramDistance
                   toViewControllerLayoutGuide:(id<UILayoutSupport>)paramLayoutGuide
                                            at:(INSLayoutConstraintLocation)paramLocation
                                      relation:(NSLayoutRelation)paramRelation;

/**
 Sets translatesAutoresizingMaskIntoConstraints on all subviews.
 @param paramTranslates Flag.
 */
- (void)setTranslatesAutoresizingMaskIntoConstraintsOnAllSubviews:(BOOL)paramTranslates;

@end
