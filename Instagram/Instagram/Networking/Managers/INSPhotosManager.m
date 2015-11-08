//
//  INSPhotosManager.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "NSString+INSAdditions.h"
#import "INSNetworkManager.h"
#import "INSPhotosManager.h"
#import "INSRequest.h"
#import "INSPhoto.h"

//https://api.instagram.com/v1/media/popular?client_id=358150b5ca1a41c38b0a99a47e6557a4
//https://api.instagram.com/v1/tags/nofilter/media/recent?client_id=358150b5ca1a41c38b0a99a47e6557a4&&max_tag_id=1113882942266843447

static NSString * const kINSPopularItemsURL = @"media/popular";
static NSString * const kINSRecentMediaURL = @"media/recent";
static NSString * const kINSTagsURL = @"tags";
static NSString * const kINSNextMaxIDKey = @"next_max_id";
static NSString * const kINSMaxTagIDKey = @"max_tag_id";
static NSString * const kINSPaginationKey = @"pagination";
static NSString * const kINSCountKey = @"count";

@implementation INSPhotosManager

+ (instancetype)sharedInstance
{
    static INSPhotosManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:kINSBaseURL];
        sharedInstance = [[INSPhotosManager alloc] initWithBaseURL:baseUrl];
    });
    
    return sharedInstance;
}

- (NSString *)getPopularPhotosWithCompletion:(INSGetPhotosRequestCompletion)completion
{
    INSRequest *popularPhotosRequest = [[INSRequest alloc] initWithRequestType:INSRequestTypeGet relativeURL:kINSPopularItemsURL];
    
    popularPhotosRequest.additionalParameters[kINSCountKey] = @"100";
    
   return [self sendRequest:popularPhotosRequest completion:^(NSError *error, id data)
     {
         if (completion)
         {
             if (error)
             {
                 completion(error, nil);
             }
             else
             {
                 NSArray *photosArray = [data arrayForKey:kINSDataKey];
                 NSMutableArray *mutablePhotos = [NSMutableArray array];
                 
                 [photosArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                     INSPhoto *photo = [[INSPhoto alloc] initWithDictionary:obj];
                     [mutablePhotos addObject:photo];
                 }];
                 
                 completion(nil, [mutablePhotos copy]);
             }
         }
     }];
}


- (NSString *)getPhotosWithKeyword:(NSString *)keyword maxTagId:(NSString *)maxTagId completion:(INSGetPhotosRequestCompletionWithPagination)completion
{
    if (!keyword)
    {
        completion ([NSError errorWithDomain:kINSNetworkingErrorDomain code:INSNetworkErrorInvalid userInfo:nil], nil, nil);
    }
    
    NSString *relativeURL = [NSString urlPathWithComponents:@[kINSTagsURL, keyword, kINSRecentMediaURL]];
    INSRequest *photosRequest = [[INSRequest alloc] initWithRequestType:INSRequestTypeGet relativeURL:relativeURL];
    
    if (maxTagId)
    {
        photosRequest.additionalParameters[kINSMaxTagIDKey] = maxTagId;
    }
    
    return [self sendRequest:photosRequest completion:^(NSError *error, id data)
            {
                if (completion)
                {
                    if (error)
                    {
                        completion(error, nil, nil);
                    }
                    else
                    {
                        NSArray *photosArray = [data arrayForKey:kINSDataKey];
                        NSMutableArray *mutablePhotos = [NSMutableArray array];
                        
                        [photosArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            INSPhoto *photo = [[INSPhoto alloc] initWithDictionary:obj];
                            [mutablePhotos addObject:photo];
                        }];
                        
                        NSString *nextMaxTagId = [[data dictionaryForKey:kINSPaginationKey] stringForKey:kINSNextMaxIDKey];
                        completion(nil, [mutablePhotos copy], nextMaxTagId);
                    }
                }
            }];
}

@end
