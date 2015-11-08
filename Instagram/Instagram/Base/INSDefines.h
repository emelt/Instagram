//
//  INSDefines.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

@interface INSDefines : NSObject

typedef NS_ENUM(NSInteger, INSRequestType) {
    INSRequestTypePut = 0,
    INSRequestTypeGet,
    INSRequestTypePost,
    INSRequestTypeSet,
    INSRequestTypePatch,
    INSRequestTypeDelete
};

#pragma mark - String Constants

extern NSString * const kINSClientID;
extern NSString * const kINSBaseURL;
extern NSString * const kINSClientIDKey;
extern NSString * const kINSDataKey;

#pragma mark - Numeric Constants

extern const CGFloat kINSDefaultMargin;

@end
