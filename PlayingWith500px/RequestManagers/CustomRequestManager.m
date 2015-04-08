//
//  CustomRequestManager.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CustomRequestManager.h"
#import "URLHelper.h"
#import "APIVars.h"

@implementation CustomRequestManager

- (void)GETendpoint:(NSString *)endpoint params:(NSDictionary *)params Completion:(void (^)(NSData *))completion
{
    
    NSURL *url = [URLHelper urlWithString:[NSString stringWithFormat:@"%@%@", BASE_POINT, endpoint] andParams:params];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error)
        {
            completion([NSData data]);
        }
        else
        {
            completion(data);
        }
        
    }] resume];
}

@end
