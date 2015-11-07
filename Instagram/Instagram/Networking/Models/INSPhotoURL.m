//
//  INSPhotoURL.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSPhotoURL.h"

static NSString * const kINSWidthKey = @"width";
static NSString * const kINSHeightKey = @"height";
static NSString * const kINSURLKey = @"url";

@implementation INSPhotoURL

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    
    if (self)
    {
        _width = [dictionary floatForKey:kINSWidthKey];
        _height = [dictionary floatForKey:kINSHeightKey];
        _url = [dictionary stringForKey:kINSURLKey];
    }
    
    return self;
}

@end
