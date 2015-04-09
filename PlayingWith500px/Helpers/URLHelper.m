//
//  URLHelper.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "URLHelper.h"

@implementation URLHelper

+ (NSURL *)urlWithString:(NSString *)url andParams:(NSDictionary *)params
{
    NSMutableString *finalURL = [url mutableCopy];
    NSString *param;
    NSString *concatenator = @"?";
    
    for (NSString *key in params)
    {
        if ([params[key] isKindOfClass:[NSArray class]])
        {
            param = [URLHelper paramsFromArray:params[key] withKey:key];
        }
        else
        {
            param = [URLHelper paramFromString:params[key] andKey:key];
        }
        [URLHelper addParam:param toUrl:finalURL withConcatenator:concatenator];
        concatenator = @"&";
    }
    
    return [NSURL URLWithString:finalURL];
}

+ (void)addParam:(NSString *)param toUrl:(NSMutableString *)url withConcatenator:(NSString *)concatenator
{
    [url appendFormat:@"%@%@", concatenator, param];
}

+ (NSString *)paramsFromArray:(NSArray *)params withKey:(NSString *)key
{
    NSMutableString *stringParams = [NSMutableString string];
    
    BOOL firstTime = YES;
    for (NSString *param in params)
    {
        if (firstTime)
        {
            [stringParams appendFormat:@"%@=%@", key, param];
            firstTime = NO;
        }
        else
        {
            [stringParams appendFormat:@"&%@=%@", key, param];
        }
    }
    
    return stringParams;
}

+ (NSString *)paramFromString:(NSString *)param andKey:(NSString *)key
{
    return [NSString stringWithFormat:@"%@=%@", key, param];
}

@end
