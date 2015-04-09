//
//  Photo.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Photo : NSObject

@property (nonatomic, copy) NSString *photoId;
@property (nonatomic, copy) NSString *photoName;
@property (nonatomic, copy) NSString *photoDescription;
@property (nonatomic, copy) NSString *photoCamera;
@property (nonatomic, copy) NSString *photoAperture;
@property (nonatomic, copy) NSString *photoRating;
@property (nonatomic, copy) NSString *photoLatitude;
@property (nonatomic, copy) NSString *photoLongitude;
@property (nonatomic, copy) NSString *photoMiniPicUrl;
@property (nonatomic, copy) NSString *photoBigPicUrl;
@property (nonatomic, strong) User *photoUser;

@end
