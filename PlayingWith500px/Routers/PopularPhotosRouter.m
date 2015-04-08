//
//  MainRouter.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PopularPhotosRouter.h"
#import "PopularPhotosViewController.h"
#import "LoadPopularPhotosInteractor.h"


@interface PopularPhotosRouter ()

@property (nonatomic, weak) PopularPhotosViewController *popularPhotosViewController;

@end

@implementation PopularPhotosRouter

- (void)showViewInWindow:(UIWindow *)window
{
    PopularPhotosViewController *ppViewControler = [[PopularPhotosViewController alloc] init];
    ppViewControler.router = self;
    self.popularPhotosViewController = ppViewControler;
    ppViewControler.loadPopularPhotosInteractor = [LoadPopularPhotosInteractor new];
    
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:ppViewControler];
    
    [window setRootViewController:nc];
    [window makeKeyAndVisible];
}

@end
