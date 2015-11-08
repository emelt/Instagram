//
//  NSString+INSAdditions.m
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

static NSString * const kINSSlashString = @"/";

#import "NSString+INSAdditions.h"

@implementation NSString (INSAdditions)

+ (NSString *)urlPathWithComponents:(NSArray *)array
{
    NSMutableString *resultString = [NSMutableString string];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]])
        {
            NSString *stringComponent = obj;
            if ([stringComponent hasPrefix:kINSSlashString])
            {
                stringComponent = [stringComponent substringFromIndex:1];
            }
            if ([stringComponent hasSuffix:kINSSlashString])
            {
                stringComponent = [stringComponent substringToIndex:stringComponent.length - 1];
            }
            
            [resultString appendString:stringComponent];
            if (idx != array.count - 1)
            {
                [resultString appendString:kINSSlashString];
            }
        }
    }];
    
    return resultString;
}

@end
