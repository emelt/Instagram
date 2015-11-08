//
//  INSRequest+StringHelpers.m
//  Instagram
//
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSRequest+StringHelpers.h"

NSString * const INSRequestTypesStringArray[] =
{
    [INSRequestTypePut] = @"PUT",
    [INSRequestTypeGet] = @"GET",
    [INSRequestTypePost] = @"POST",
    [INSRequestTypeSet] = @"SET",
    [INSRequestTypePatch] = @"PATCH",
    [INSRequestTypeDelete] = @"DELETE",
};

@implementation INSRequest (RequestType)

- (NSString *)requestTypeString
{
    return INSRequestTypesStringArray[self.requestType];
}

@end
