//
//  NSString+INSAdditions.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

@interface NSString (INSAdditions)

/**
 Creates and returns an valid url string by appending components in the given string array
 Checks for dashes between each component in the given array, if there are duplicates elimintes, if there are missing ones it addes
 @param array Array of strings which will be used to creation of the path, if the item is not a string then it skips
 @return A valid url string
 */
+ (NSString *)urlPathWithComponents:(NSArray *)array;

@end
