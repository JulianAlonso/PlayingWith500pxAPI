//
//  UserParser.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "UserParser.h"
#import "User.h"

NSString *const kDicUserId = @"id";
NSString *const kDicUserName = @"fullname";
NSString *const kDicUserAvatarURL = @"userpic_url";

@implementation UserParser

+ (User *)userFromDictionary:(NSDictionary *)dictionary
{
    User *user = [User new];
    
    user.userId = dictionary[kDicUserId];
    user.userName = dictionary[kDicUserName];
    user.userAvatarURL = dictionary[kDicUserAvatarURL];
    
    return user;
}

@end
