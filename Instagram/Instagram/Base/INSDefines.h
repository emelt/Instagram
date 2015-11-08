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

//Temp solution until creation of styling classes
#define RGB(r, g, b) \
[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define RGBA(r, g, b, a) \
[UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define InstaBlueColor RGB(18.0f, 86.0f, 136.0f)

@end
