//
//  INSDateFormatter.m
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

#import "INSDateFormatter.h"

@interface INSDateFormatter ()

@property (strong, nonatomic) NSDateFormatter *outputDateFormatter;

@end

@implementation INSDateFormatter

+ (INSDateFormatter *)sharedFormatter
{
    static INSDateFormatter *sharedFormatter = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedFormatter = [[INSDateFormatter alloc] init];
    });
    
    return sharedFormatter;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _outputDateFormatter = [[NSDateFormatter alloc]init];
        
        // DateFormatter's default locale is device's language.
        _outputDateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
    }
    
    return self;
}

#pragma mark - public methods

- (NSDate *)dateFromUTCTime:(NSTimeInterval)utcTime
{
    NSDate *utcDate = [NSDate dateWithTimeIntervalSince1970:utcTime];
    
    [self.outputDateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [self.outputDateFormatter setDateFormat:@"yyyy.MM.dd G 'at' HH:mm:ss zzz"];
    
    NSString *utcString = [self.outputDateFormatter stringFromDate:utcDate];
    
    [self.outputDateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    return [self.outputDateFormatter dateFromString:utcString];

}

@end
