//
//  PhotoParser.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Photo;

@interface PhotoParser : NSObject

+ (NSArray *)photosFromDictionaries:(NSArray *)dictionaries;
+ (Photo *)photoFromDictionary:(NSDictionary *)dictionary;

@end
