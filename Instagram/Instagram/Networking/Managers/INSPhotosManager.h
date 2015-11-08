//
//  INSPhotosManager.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

@class INSPhoto;

typedef void(^INSGetPhotosRequestCompletion)(NSError *error, NSArray<INSPhoto *> *photos);
typedef void(^INSGetPhotosRequestCompletionWithPagination)(NSError *error, NSArray<INSPhoto *> *photos, NSString *nextMaxTagId);

@interface INSPhotosManager : INSNetworkManager

/**
 Shared instance of photos manager, use for request cancellation
 */
+ (instancetype)sharedInstance;

/**
 Fetches array of popular public photos
 */
- (NSString *)getPopularPhotosWithCompletion:(INSGetPhotosRequestCompletion)completion;

/**
 Searches photos with given keyword, returns results ordered from newest to oldest
 Use maxTagId of previous response to fetch next group of results
 */
- (NSString *)getPhotosWithKeyword:(NSString *)keyword maxTagId:(NSString *)maxTagId completion:(INSGetPhotosRequestCompletionWithPagination)completion;

@end
