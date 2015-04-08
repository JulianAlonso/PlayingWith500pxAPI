//
//  PopularPhotosViewController.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopularPhotosRouter;
@class LoadPopularPhotosInteractor;

@interface PopularPhotosViewController : UIViewController

@property (nonatomic, strong) PopularPhotosRouter *router;
@property (nonatomic, strong) LoadPopularPhotosInteractor *loadPopularPhotosInteractor;

@end
