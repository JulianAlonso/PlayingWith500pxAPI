//
//  PopularPhotoCollectionViewCellController.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "PopularPhotoCollectionViewCellController.h"
#import "PopularPhotoCollectionViewCell.h"
#import "Photo.h"

@interface PopularPhotoCollectionViewCellController () <PopularPhotoCollectionViewCellDelegate>

@end

@implementation PopularPhotoCollectionViewCellController

- (UICollectionViewCell *)configuredCell
{
    self.cell.photoNameLabel.text = self.photo.photoName;
    [self.cell.photoImageView sd_setImageWithURL:[NSURL URLWithString:self.photo.photoMiniPicUrl]];
    
    self.cell.delegate = self;
    
    return self.cell;
}

#pragma mark - PopularPhotoCollectionViewCellDelegate methods.
- (void)didTapAtPopularPhotoCollectionViewCell:(PopularPhotoCollectionViewCell *)cell
{
    [self.delegate didTapAtCell:cell withPhoto:self.photo];
}

@end
