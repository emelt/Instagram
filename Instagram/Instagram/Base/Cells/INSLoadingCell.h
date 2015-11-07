//
//  INSLoadingCell.h
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSTableViewCell.h"

@interface INSLoadingCell : INSTableViewCell

@property (assign, nonatomic, getter=isLoading) BOOL loading;

+ (instancetype)instance;

@end
