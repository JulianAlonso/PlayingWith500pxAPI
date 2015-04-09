//
//  UserMO+Implementation.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "UserMO+Implementation.h"
#import "User.h"

@implementation UserMO (Implementation)

+ (UserMO *)userMOFromUser:(User *)user atManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    UserMO *userMO = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([UserMO class]) inManagedObjectContext:managedObjectContext];
    
    userMO.userId = user.userId;
    userMO.userName = user.userName;
    userMO.userAvatarURL = user.userAvatarURL;
    
    return userMO;
}

@end
