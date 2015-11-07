//
//  NSDictionary+Parsing.m
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

#import "NSDictionary+Parsing.h"

@implementation NSDictionary (Parsing)

- (NSString *)stringForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSString class]])
    {
        return object;
    }
    else if ([object respondsToSelector:@selector(stringValue)])
    {
        return [object performSelector:@selector(stringValue)];
    }
    
    return nil;
}

- (NSArray *)arrayForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSArray class]])
    {
        return object;
    }
    
    return nil;
}

- (NSDictionary *)dictionaryForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSDictionary class]])
    {
        return object;
    }
    
    return nil;
}

- (NSData *)dataForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSData class]])
    {
        return object;
    }
    
    return nil;
}

- (NSInteger)integerForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return 0;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
    {
        return [object integerValue];
    }
    
    return 0;
}

- (float)floatForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return 0;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
    {
        return [object floatValue];
    }
    
    return 0;
}

- (double)doubleForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return 0;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
    {
        return [object doubleValue];
    }
    
    return 0;
}

- (BOOL)boolForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return NO;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
    {
        return [object boolValue];
    }
    
    return NO;
}

- (NSURL *)URLForKey:(NSString *) inKey
{
    if ([inKey length] == 0)
    {
        return 0;
    }
    
    id object = [self objectForKey:inKey];
    if ([object isKindOfClass:[NSString class]])
    {
        return [NSURL URLWithString:object];
    }
    else if ([object isKindOfClass:[NSURL class]])
    {
        return object;
    }
    
    return 0;
}

@end
