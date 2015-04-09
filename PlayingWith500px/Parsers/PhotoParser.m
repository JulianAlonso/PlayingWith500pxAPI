//
//  PhotoParser.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoParser.h"
#import "Photo.h"

NSString *const kDicPhotoId = @"id";
NSString *const kDicPhotoName = @"name";
NSString *const kDicPhotoDescription = @"description";
NSString *const kDicPhotoAperture = @"aperture";
NSString *const kDicPhotoCamera = @"camera";
NSString *const kDicPhotoImages = @"images";
NSString *const kDicPhotoRating = @"rating";
NSString *const kDicImageUrl = @"url";

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
    photo.photoURL = [PhotoParser photoUrlFromImagesDic:dictionary[kDicPhotoImages]];
    
    return photo;
}

+ (NSString *)photoUrlFromImagesDic:(NSArray *)dictionaries
{
    NSDictionary *imageDic = dictionaries.firstObject;
    
    return imageDic[kDicImageUrl];
}

@end
