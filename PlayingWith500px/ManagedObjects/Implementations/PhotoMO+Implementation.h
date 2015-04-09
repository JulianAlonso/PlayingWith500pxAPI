//
//  PhotoMO+Implementation.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoMO.h"

@class Photo;
@class NSManagedObjectContext;

@interface PhotoMO (Implementation)

+ (PhotoMO *)photoMOFromPhoto:(Photo *)photo andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
