//
//  PopularPhotosViewController.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PopularPhotosViewController.h"
#import "LoadPopularPhotosInteractor.h"
#import "PopularPhotoCollectionViewCell.h"
#import "Photo.h"
#import "PopularPhotoCollectionViewCellController.h"

NSString *const kPhotosPath = @"photos";

@interface PopularPhotosViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation PopularPhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configPhotoCollectionView];
    [self registerToObservePhotos];
    [self loadPhotos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews
{
    self.photosCollectionView.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length, 0, 0, 0);
}

#pragma mark - Config methods.
- (void)configPhotoCollectionView
{
    [self.photosCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PopularPhotoCollectionViewCell class]) bundle:nil]
                forCellWithReuseIdentifier:NSStringFromClass([PopularPhotoCollectionViewCell class])];
    self.photosCollectionView.delegate = self;
    self.photosCollectionView.dataSource = self;
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

#pragma mark - Update methods.
- (void)updateControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (__unused Photo *p in self.photos)
    {
        PopularPhotoCollectionViewCellController *controller = [PopularPhotoCollectionViewCellController new];
        [controllers addObject:controller];
    }
    self.controllers = controllers;
}

#pragma mark - Observe methods.
- (void)registerToObservePhotos
{
    [self addObserver:self forKeyPath:kPhotosPath options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisterToObservePhotos
{
    [self removeObserver:self forKeyPath:kPhotosPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kPhotosPath])
    {
        [self updateControllers];
        [self.photosCollectionView reloadData];
    }
}

#pragma mark - DataSource methods.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PopularPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PopularPhotoCollectionViewCell class]) forIndexPath:indexPath];
    
    PopularPhotoCollectionViewCellController *controller = self.controllers[indexPath.item];
    
    controller.cell = cell;
    controller.photo = self.photos[indexPath.item];
    
    return [controller configuredCell];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

#pragma mark - LayoutDelegate methods.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(200, 200);
}

#pragma mark - Dealloc methods.
- (void)dealloc
{
    [self unregisterToObservePhotos];
}
@end
