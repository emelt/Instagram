//
//  NSDictionary+Parsing.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright (c) 2003-2015 Monitise Group Limited. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Monitise Group Limited.
//  Any reproduction of this material must contain this notice.
//

#import <Foundation/Foundation.h>

/**
 Category on NSDictionary that is used for safely fetching given object types
 */
@interface NSDictionary (Parsing)

/**
 @method
 Used for getting the NSString for the given key
 @param inKey Object key
 @return NSString object for the given key if exists, nil if not found or key is nil
 */
- (NSString *)stringForKey:(NSString *)inKey;

/**
 @method
 Used for getting the NSArray for the given key
 @param inKey Object key
 @return NSArray object for the given key if exists, nil if not found or key is nil
 */
- (NSArray *)arrayForKey:(NSString *)inKey;

/**
 @method
 Used for getting the NSDictionary for the given key
 @param inKey Object key
 @return NSDictionary object for the given key if exists, nil if not found or key is nil
 */
- (NSDictionary *)dictionaryForKey:(NSString *)inKey;

/**
 @method
 Used for getting the NSData for the given key
 @param inKey Object key
 @return NSData object for the given key if exists, nil if not found or key is nil
 */
- (NSData *)dataForKey:(NSString *)inKey;

/**
 @method
 Used for getting the NSInteger for the given key
 @param inKey Object key
 @return NSInteger for the given key if exists, 0 if not found or key is nil
 */
- (NSInteger)integerForKey:(NSString *)inKey;

/**
 @method
 Used for getting the float for the given key
 @param inKey Object key
 @return float for the given key if exists, 0 if not found or key is nil
 */
- (float)floatForKey:(NSString *)inKey;

/**
 @method
 Used for getting the double for the given key
 @param inKey Object key
 @return double for the given key if exists, 0 if not found or key is nil
 */
- (double)doubleForKey:(NSString *)inKey;

/**
 @method
 Used for getting the BOOL for the given key
 @param inKey Object key
 @return BOOL object for the given key if exists, 0 if not found or key is nil
 */
- (BOOL)boolForKey:(NSString *)inKey;

/**
 @method
 Used for getting the NSURL for the given key
 @param inKey Object key
 @return NSURL object for the given key if exists, nil if not found or key is nil
 */
- (NSURL *)URLForKey:(NSString *)inKey;

@end
