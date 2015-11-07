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
    
   return [self sendRequest:popularPhotosRequest completion:^(NSError *error, id data)
     {
         if (completion)
         {

         }
     }];
    
}

@end
