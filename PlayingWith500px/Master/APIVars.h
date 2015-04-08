//
//  APIVars.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const BASE_POINT;
extern NSString *const PHOTOS_END_POINT;
extern NSString *const API_KEY;
extern NSString *const PARAM_FEATURE;
extern NSString *const POPULAR_FEATURE;

@interface APIVars : NSObject

+ (NSDictionary *)defaultParams;

@end
