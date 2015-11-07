//
//  INSUser.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSUser.h"

static NSString * const kINSProfilePicKey = @"profile_picture";
static NSString * const kINSUsernameKey = @"username";
static NSString * const kINSUserIdKey = @"id";

@implementation INSUser

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    
    if (self)
    {
        _userId = [dictionary stringForKey:kINSUserIdKey];
        _nickname = [dictionary stringForKey:kINSUsernameKey];
        _profilePhotoUrl = [dictionary stringForKey:kINSProfilePicKey];
    }
    
    return self;
}

@end
