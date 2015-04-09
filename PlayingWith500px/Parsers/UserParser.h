//
//  UserParser.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface UserParser : NSObject

+ (User *)userFromDictionary:(NSDictionary *)dictionary;

@end
