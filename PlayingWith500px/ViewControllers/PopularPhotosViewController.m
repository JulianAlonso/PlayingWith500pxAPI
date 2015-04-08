//
//  PopularPhotosViewController.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PopularPhotosViewController.h"
#import "LoadPopularPhotosInteractor.h"

@interface PopularPhotosViewController ()

@property (nonatomic, strong) NSArray *photos;

@end

@implementation PopularPhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadPhotos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - load methods.
- (void)loadPhotos
{
    __weak typeof(self) weakSelf = self;
    CompletedLoadPhotos block = ^void(NSArray *photos) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        strongSelf.photos = photos;
    };
    
    [self.loadPopularPhotosInteractor loadPopularPhotosWithCompletion:block andUpdate:block];
}

@end
