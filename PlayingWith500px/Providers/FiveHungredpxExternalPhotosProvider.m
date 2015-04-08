//
//  FiveHungredpxExternalPhotosProvider.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FiveHungredpxExternalPhotosProvider.h"
#import "APIVars.h"
#import "RequestManagerFactory.h"
#import "PhotoParser.h"

@implementation FiveHungredpxExternalPhotosProvider

- (void)loadPopularPhotosWithCompletion:(void (^)(NSArray *))completion
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[APIVars defaultParams]];
    [params setObject:POPULAR_FEATURE forKey:PARAM_FEATURE];
    
    [self.requestManager GETendpoint:PHOTOS_END_POINT params:params Completion:^(NSData *data) {
        
        if (data)
        {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            completion([PhotoParser photosFromDictionaries:dic[@"photos"]]);
        }
    }];
}

- (id<RequestManager>)requestManager
{
    if (!_requestManager)
    {
        _requestManager = [RequestManagerFactory defaultRequestManager];
    }
    return _requestManager;
}

@end
