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
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation PopularPhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configRefreshControl];
    [self configPhotoCollectionView];
    [self registerToObservePhotos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.photosCollectionView.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length, 0, 0, 0);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self startResfresh];
}

#pragma mark - Config methods.
- (void)configPhotoCollectionView
{
    [self.photosCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PopularPhotoCollectionViewCell class]) bundle:nil]
                forCellWithReuseIdentifier:NSStringFromClass([PopularPhotoCollectionViewCell class])];
    self.photosCollectionView.delegate = self;
    self.photosCollectionView.dataSource = self;
    self.photosCollectionView.alwaysBounceVertical = YES;
    [self.photosCollectionView addSubview:self.refreshControl];
}

- (void)configRefreshControl
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(loadPhotos) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - load methods.
- (void)loadPhotos
{
    __weak typeof(self) weakSelf = self;
    CompletedLoadPhotos block = ^void(NSArray *photos) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.photos = photos;
            [strongSelf.photosCollectionView reloadData];
        });
    };
    
    [self.loadPopularPhotosInteractor loadPopularPhotosWithCompletion:block andUpdate:^(NSArray *photos) {
        block(photos);
        [weakSelf.refreshControl endRefreshing];
    }];
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

#pragma mark - Custom methods.
- (void)startResfresh
{

    if (self.photosCollectionView.contentOffset.y == -self.topLayoutGuide.length)
    {
        [self.refreshControl beginRefreshing];
        
        [self.photosCollectionView setContentOffset:CGPointMake(0, - self.topLayoutGuide.length - CGRectGetHeight(self.refreshControl.frame)) animated:YES];
        
        [self loadPhotos];
    }
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
    CGFloat lado = CGRectGetWidth(self.photosCollectionView.frame) / 2;
    return CGSizeMake(lado, lado);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

#pragma mark - Dealloc methods.
- (void)dealloc
{
    [self unregisterToObservePhotos];
}
@end
