//
//  INSRequest.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INSRequest : NSObject

/**
 Relative URL, the url component which will be added to base url
 */
@property (copy, nonatomic, readonly) NSString *relativeURL;

@property (assign, nonatomic, readonly) INSRequestType requestType;

/**
 Additional parameters that will be added to request url
 Like search components, filters
 */
@property (nonatomic, strong) NSMutableDictionary *additionalParameters;

/**
 Creates an instance of INSRequest with the given parameters and default header
 @param type of request
 @param relativeURL The url component which will be added to base URL
 @param username if the request url requires a username
 */
- (instancetype)initWithRequestType:(INSRequestType)type
                        relativeURL:(NSString *)relativeURL;

@end
