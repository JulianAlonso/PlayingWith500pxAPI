//
//  LoadPopularPhotosInteractor.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalPhotosProvider.h"
#import "ExternalPhotosProvider.h"

typedef void(^CompletedLoadPhotos)(NSArray *photos);

@interface LoadPopularPhotosInteractor : NSObject

@property (nonatomic, strong) id<LocalPhotosProvider> localPhotosProvider;
@property (nonatomic, strong) id<ExternalPhotosProvider> externalPhotosProvider;

- (void)loadPopularPhotosWithCompletion:(CompletedLoadPhotos)completion andUpdate:(CompletedLoadPhotos)update;

@end
