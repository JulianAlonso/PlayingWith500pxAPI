//
//  PhotoMO+Implementation.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoMO+Implementation.h"
#import "Photo.h"
#import "UserMO+Implementation.h"

@implementation PhotoMO (Implementation)

+ (PhotoMO *)photoMOFromPhoto:(Photo *)photo andManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    PhotoMO *photoMO = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([PhotoMO class]) inManagedObjectContext:managedObjectContext];
    
    photoMO.photoId = photo.photoId;
    photoMO.photoName = photo.photoName;
    photoMO.photoDescription = photo.photoDescription;
    photoMO.photoCamera = photo.photoCamera;
    photoMO.photoAperture = photo.photoAperture;
    photoMO.photoRating = photo.photoRating;
    photoMO.photoLatitude = photo.photoLatitude;
    photoMO.photoLongitude = photo.photoLongitude;
    photoMO.photoMiniPicURL = photo.photoMiniPicUrl;
    photoMO.photoBigPicURL = photo.photoBigPicUrl;
    photoMO.photoUser = [UserMO userMOFromUser:photo.photoUser atManagedObjectContext:managedObjectContext];
    
    return photoMO;
}

@end
