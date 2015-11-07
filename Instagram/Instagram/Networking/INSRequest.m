//
//  INSRequest.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSRequest.h"

@interface INSRequest()

@property (copy, nonatomic) NSString *relativeURL;
@property (assign, nonatomic) INSRequestType requestType;

@end

@implementation INSRequest

- (instancetype)initWithRequestType:(INSRequestType)type
                        relativeURL:(NSString *)relativeURL
{
    self = [super init];
    
    if (self)
    {
        _requestType = type;
        _relativeURL = relativeURL;
    }
    
    return self;
}

#pragma mark - Getters

- (NSMutableDictionary *)additionalParameters
{
    if (!_additionalParameters)
    {
        _additionalParameters = [NSMutableDictionary dictionary];
        _additionalParameters[kINSClientIDKey] = kINSClientID;
    }
    return _additionalParameters;
}

@end
