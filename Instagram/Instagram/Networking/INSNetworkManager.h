//
//  INSNetworkManager.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kINSNetworkingErrorDomain = @"com.instagram.networking.requestError";

typedef void(^INSRequestCompletion)(NSError *error, id data);

typedef NS_ENUM(NSInteger, INSNetworkError)
{
    INSNetworkErrorUnknown =	-1,
    INSNetworkErrorCancelled = -100,
    INSNetworkErrorInvalid =	-200,
};

@interface INSNetworkManager : NSObject

/**
 Creates an instance of networking manager object wit the given base URL object,
 That URL can not be modified after initialization.
 @param url An NSURL object
 @return INSNetworkingManager instance
 */
- (instancetype)initWithBaseURL:(NSURL *)url;

/**
 Method that sends NSURLRequest with DELETE method to given URL and additonal parameters.
 @param URLString URL string that will be appended to base URL
 @param parameters Additional parameters that will be appended to URLString
 @param cancelOthers If you want this request to avoid duplicates, set to YES
 @return Unique request token in string
 */
- (NSString *)sendRequest:(NSURLRequest *)request
               completion:(INSRequestCompletion)completion;

@end
