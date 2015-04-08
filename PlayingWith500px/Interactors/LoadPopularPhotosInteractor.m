//
//  LoadPopularPhotosInteractor.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "LoadPopularPhotosInteractor.h"

@implementation LoadPopularPhotosInteractor

- (void)loadPopularPhotosWithCompletion:(CompletedLoadPhotos)completion andUpdate:(CompletedLoadPhotos)update
{
    [self.localPhotosProvider loadStoredPhotosWithCompletion:^(NSArray *photos) {
        completion(photos);
    }];
    
    [self.externalPhotosProvider loadPopularPhotosWithCompletion:^(NSArray *photos) {
        update(photos);
    }];
}

@end
