//
//  MainRouter.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface PopularPhotosRouter : NSObject

- (void)showViewInWindow:(UIWindow *)window;
- (void)needNavigateToPhotoDetailWithPhoto:(Photo *)photo;

@end
