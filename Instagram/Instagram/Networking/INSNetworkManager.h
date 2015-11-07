//
//  INSNetworkManager.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

@class INSRequest;

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
 Method that converts given INSRequest to NSURLSessionRequest and sends it
 @param request Request model that holds basic properties, like request type, relative url, additional parameters etc.
 @param completion Completion block that'll be called at the end of execution
 @return Unique request token in string (for cancellation etc. future references)
 */
- (NSString *)sendRequest:(INSRequest *)request
               completion:(INSRequestCompletion)completion;

@end
