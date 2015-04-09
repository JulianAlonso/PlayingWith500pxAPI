//
//  PhotoParser.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoParser.h"
#import "Photo.h"
#import "UserParser.h"
#import "APIVars.h"

NSString *const kDicPhotoId = @"id";
NSString *const kDicPhotoName = @"name";
NSString *const kDicPhotoDescription = @"description";
NSString *const kDicPhotoAperture = @"aperture";
NSString *const kDicPhotoCamera = @"camera";
NSString *const kDicPhotoImages = @"images";
NSString *const kDicPhotoRating = @"rating";
NSString *const kDicPhotoLongitude = @"longitude";
NSString *const kDicPhotoLatitude = @"latitude";
NSString *const kDicImageSize = @"size";
NSString *const kDicImageUrl = @"url";
NSString *const kDicPhotoUser = @"user";

@implementation PhotoParser

+ (NSArray *)photosFromDictionaries:(NSArray *)dictionaries
{
    NSMutableArray *photos = [NSMutableArray array];
    
    for (NSDictionary *dic in dictionaries)
    {
        [photos addObject:[PhotoParser photoFromDictionary:dic]];
    }
    
    return photos;
}

+ (Photo *)photoFromDictionary:(NSDictionary *)dictionary
{
    Photo *photo = [Photo new];
    
    photo.photoId = dictionary[kDicPhotoId];
    photo.photoName = dictionary[kDicPhotoName];
    photo.photoDescription = dictionary[kDicPhotoDescription];
    photo.photoAperture = dictionary[kDicPhotoAperture];
    photo.photoCamera = dictionary[kDicPhotoCamera];
    photo.photoRating = dictionary[kDicPhotoRating];
    photo.photoLongitude = dictionary[kDicPhotoLongitude];
    photo.photoLatitude = dictionary[kDicPhotoLatitude];
    photo.photoUser = [UserParser userFromDictionary:dictionary[kDicPhotoUser]];
    
    [PhotoParser addImagesToPhoto:photo fromDictionaries:dictionary[kDicPhotoImages]];
    
    return photo;
}

+ (void)addImagesToPhoto:(Photo *)photo fromDictionaries:(NSArray *)dictionaries
{
    for (NSDictionary *dic in dictionaries)
    {
        if ([[dic[kDicImageSize] stringValue] isEqualToString:IMAGE_SIZE_3])
        {
            photo.photoMiniPicUrl = dic[kDicImageUrl];
        }
        else if ([[dic[kDicImageSize] stringValue] isEqualToString:IMAGE_SIZE_1600])
        {
            photo.photoBigPicUrl = dic[kDicImageUrl];
        }
    }
}

@end
