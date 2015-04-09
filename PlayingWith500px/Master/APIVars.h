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
extern NSString *const PARAM_IMAGE_SIZE;
extern NSString *const POPULAR_FEATURE;
extern NSString *const IMAGE_SIZE_3;
extern NSString *const IMAGE_SIZE_1600;

@interface APIVars : NSObject

+ (NSDictionary *)defaultParams;

@end
