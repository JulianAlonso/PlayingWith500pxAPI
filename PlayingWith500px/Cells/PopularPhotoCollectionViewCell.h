//
//  PopularPhotoCollectionViewCell.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopularPhotoCollectionViewCell;

@protocol PopularPhotoCollectionViewCellDelegate <NSObject>

- (void)didTapAtPopularPhotoCollectionViewCell:(PopularPhotoCollectionViewCell *)cell;

@end

@interface PopularPhotoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *photoNameLabel;
@property (nonatomic, strong) id<PopularPhotoCollectionViewCellDelegate> delegate;

@end
