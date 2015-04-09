//
//  UserMO+Implementation.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "UserMO.h"

@class User;

@interface UserMO (Implementation)

+ (UserMO *)userMOFromUser:(User *)user atManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
