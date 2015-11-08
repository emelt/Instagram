//
//  INSPhotoCell.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSPhotoCell.h"
#import "INSPhoto.h"

@interface INSPhotoCell ()

@property (strong, nonatomic) INSPhoto *photo;

@end

@implementation INSPhotoCell

- (void)updateCellWithModel:(INSModel *)model
{
    if ([model isKindOfClass:[INSPhoto class]])
    {
        self.photo = (INSPhoto *)model;
    }
}

@end
