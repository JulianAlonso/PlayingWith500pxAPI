//
//  PopularPhotoCollectionViewCellController.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface PopularPhotoCollectionViewCellController : NSObject

@property (nonatomic, weak) UICollectionViewCell *cell;
@property (nonatomic, strong) Photo *photo;

- (UICollectionViewCell *)configuredCell;

@end