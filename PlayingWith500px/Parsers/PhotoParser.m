//
//  PhotoParser.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoParser.h"
#import "Photo.h"

NSString *const kDicPhotoName = @"name";
NSString *const kDicPhotoDescription = @"description";
NSString *const kDicPhotoAperture = @"aperture";
NSString *const kDicPhotoCamera = @"camera";
NSString *const kDicPhotoImages = @"images";
NSString *const kDicImageUrl = @"url";

@implementation PhotoParser

+ (NSArray *)photosFromDictionaries:(NSArray *)dictionaries
{
    NSMutableArray *photos = [NSMutableArray array];
    
    for (NSDictionary *dic in dictionaries)
    {
        Photo *photo = [Photo new];
        
        photo.photoName = dic[kDicPhotoName];
        photo.photoDescription = dic[kDicPhotoDescription];
        photo.photoAperture = dic[kDicPhotoAperture];
        photo.photoCamera = dic[kDicPhotoCamera];
        photo.photoURL = [PhotoParser photoUrlFromImagesDic:dic[kDicPhotoImages]];
        
        [photos addObject:photo];
    }
    
    return photos;
}

+ (NSString *)photoUrlFromImagesDic:(NSArray *)dictionaries
{
    NSDictionary *imageDic = dictionaries.firstObject;
    
    return imageDic[kDicImageUrl];
}

@end
