//
//  INSPhoto.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSPhotoURL.h"
#import "INSPhoto.h"
#import "INSUser.h"

static NSString * const kINSCaptionKey = @"caption";
static NSString * const kINSTextKey = @"text";
static NSString * const kINSUserKey = @"user";
static NSString * const kINSThumbnailKey = @"thumbnail";
static NSString * const kINSLowResolutionKey = @"low_resolution";
static NSString * const kINSStandartResolutionKey = @"standard_resolution";
static NSString * const kINSLikesKey = @"likes";
static NSString * const kINSCommentsKey = @"comments";
static NSString * const kINSCountKey = @"count";
static NSString * const kINSIdKey = @"id";
static NSString * const kINSImagesKey = @"images";
static NSString * const kINSTimeKey = @"created_time";

@implementation INSPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    
    if (self)
    {
        _commentCount = [[dictionary dictionaryForKey:kINSCommentsKey] integerForKey:kINSCountKey];
        _likeCount = [[dictionary dictionaryForKey:kINSLikesKey] integerForKey:kINSCountKey];
        _owner = [[INSUser alloc] initWithDictionary:[dictionary dictionaryForKey:kINSUserKey]];
        _caption = [[dictionary dictionaryForKey:kINSCaptionKey] stringForKey:kINSTextKey];
        _photoId = [dictionary stringForKey:kINSIdKey];
        _time = [NSDate dateWithTimeIntervalSince1970:[dictionary doubleForKey:kINSTimeKey]];
        
        NSDictionary *imagesDictionary = [dictionary dictionaryForKey:kINSImagesKey];
        _lowResolution = [[INSPhotoURL alloc] initWithDictionary:[imagesDictionary dictionaryForKey:kINSLowResolutionKey]];
        _standard_resolution = [[INSPhotoURL alloc] initWithDictionary:[imagesDictionary dictionaryForKey:kINSStandartResolutionKey]];
        _thumbnail = [[INSPhotoURL alloc] initWithDictionary:[imagesDictionary dictionaryForKey:kINSThumbnailKey]];
    }
    
    return self;
}

@end
