//
//  PopularPhotoCollectionViewCellController.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;
@class PopularPhotoCollectionViewCell;

@protocol PopularPhotoCollectionViewCellControllerDelegate <NSObject>

- (void) didTapAtCell:(PopularPhotoCollectionViewCell *)cell withPhoto:(Photo *)photo;

@end

@interface PopularPhotoCollectionViewCellController : NSObject

@property (nonatomic, weak) PopularPhotoCollectionViewCell *cell;
@property (nonatomic, strong) Photo *photo;
@property (nonatomic, strong) id<PopularPhotoCollectionViewCellControllerDelegate> delegate;

- (UICollectionViewCell *)configuredCell;

@end
