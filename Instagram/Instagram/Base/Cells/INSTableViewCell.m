//
//  INSTableViewCell.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSTableViewCell.h"

@implementation INSTableViewCell


- (instancetype)initWithDefaults
{
    Class cellClass = [self class];
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[cellClass reuseIdentifier]];
    
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
