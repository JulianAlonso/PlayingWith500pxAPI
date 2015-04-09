//
//  PhotoMO.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserMO;

@interface PhotoMO : NSManagedObject

@property (nonatomic, retain) NSString * photoId;
@property (nonatomic, retain) NSString * photoName;
@property (nonatomic, retain) NSString * photoDescription;
@property (nonatomic, retain) NSString * photoCamera;
@property (nonatomic, retain) NSString * photoAperture;
@property (nonatomic, retain) NSString * photoRating;
@property (nonatomic, retain) NSString * photoLatitude;
@property (nonatomic, retain) NSString * photoLongitude;
@property (nonatomic, retain) NSString * photoMiniPicURL;
@property (nonatomic, retain) NSString * photoBigPicURL;
@property (nonatomic, retain) UserMO *photoUser;

@end
