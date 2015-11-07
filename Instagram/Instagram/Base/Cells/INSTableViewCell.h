//
//  INSTableViewCell.h
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

@interface INSTableViewCell : UITableViewCell

/**
 Creates an instance of cell with default style and class name as reuse identifier
 */
- (instancetype)initWithDefaults;

/**
 Returns class name as reuse identifier
 */
+ (NSString *)reuseIdentifier;

@end
