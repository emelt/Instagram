//
//  INSPhoto.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

@class INSPhotoURL;
@class INSUser;

@interface INSPhoto : INSModel

@property (strong, nonatomic) NSString *photoId;

@property (strong, nonatomic) NSString *caption;

@property (strong, nonatomic) INSUser *owner;

@property (assign, nonatomic) NSUInteger commentCount;

@property (assign, nonatomic) NSUInteger likeCount;

@property (strong, nonatomic) INSPhotoURL *lowResolution;

@property (strong, nonatomic) INSPhotoURL *thumbnail;

@property (strong, nonatomic) INSPhotoURL *standard_resolution;

@end
