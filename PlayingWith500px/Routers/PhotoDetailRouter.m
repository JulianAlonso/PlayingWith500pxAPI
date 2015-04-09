//
//  PhotoDetailRouter.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoDetailRouter.h"
#import "PhotoDetailViewController.h"

@interface PhotoDetailRouter ()

@property (nonatomic, weak) PhotoDetailViewController *photoDetailVC;

@end

@implementation PhotoDetailRouter

- (void)pushFromNavigationController:(UINavigationController *)navigationController withPhoto:(Photo *)photo
{
    PhotoDetailViewController *photoDetailVC = [[PhotoDetailViewController alloc] init];
    photoDetailVC.photo = photo;
    photoDetailVC.router = self;
    self.photoDetailVC = photoDetailVC;
    
    [navigationController pushViewController:photoDetailVC animated:YES];
}

@end
