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

- (void)updateWithPhoto:(INSPhoto *)photo
{
    self.photo = photo;
}

@end
