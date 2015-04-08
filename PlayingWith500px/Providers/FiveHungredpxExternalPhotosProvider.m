//
//  FiveHungredpxExternalPhotosProvider.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FiveHungredpxExternalPhotosProvider.h"
#import "APIVars.h"

@implementation FiveHungredpxExternalPhotosProvider

- (void)loadPopularPhotosWithCompletion:(void (^)(NSArray *))completion
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[APIVars defaultParams]];
    [params setObject:POPULAR_FEATURE forKey:PARAM_FEATURE];
    
    [self.requestManager GETendpoint:PHOTOS_END_POINT params:params Completion:^(NSData *data) {
        NSLog(@"DATA %@", data);
    }];
}

@end
