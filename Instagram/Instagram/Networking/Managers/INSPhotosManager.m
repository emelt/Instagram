//
//  INSPhotosManager.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSNetworkManager.h"
#import "INSPhotosManager.h"
#import "INSRequest.h"
#import "INSPhoto.h"

//https://api.instagram.com/v1/media/popular?client_id=358150b5ca1a41c38b0a99a47e6557a4

static NSString * const kINSPopularItemsURL = @"media/popular";

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
    
    popularPhotosRequest.additionalParameters[@"max_id"] = @"13872296";
    
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

@end
