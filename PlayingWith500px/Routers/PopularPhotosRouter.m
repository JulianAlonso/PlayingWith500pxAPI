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
#import "FiveHungredpxExternalPhotosProvider.h"
#import "PhotoDetailRouter.h"


@interface PopularPhotosRouter ()

@property (nonatomic, weak) PopularPhotosViewController *popularPhotosViewController;

@end

@implementation PopularPhotosRouter

- (void)showViewInWindow:(UIWindow *)window
{
    PopularPhotosViewController *ppViewControler = [[PopularPhotosViewController alloc] init];
    ppViewControler.router = self;
    self.popularPhotosViewController = ppViewControler;
    
    LoadPopularPhotosInteractor *lppi = [LoadPopularPhotosInteractor new];
    lppi.externalPhotosProvider = [FiveHungredpxExternalPhotosProvider new];
    ppViewControler.loadPopularPhotosInteractor = lppi;
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:ppViewControler];
    
    [window setRootViewController:nc];
    [window makeKeyAndVisible];
}

- (void)needNavigateToPhotoDetailWithPhoto:(Photo *)photo
{
    PhotoDetailRouter *detailRouter = [PhotoDetailRouter new];
    [detailRouter pushFromNavigationController:self.popularPhotosViewController.navigationController withPhoto:photo];
}

@end
