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

@implementation PopularPhotoCollectionViewCellController

- (UICollectionViewCell *)configuredCell
{
    self.cell.photoNameLabel.text = self.photo.photoName;
    [self.cell.photoImageView sd_setImageWithURL:[NSURL URLWithString:self.photo.photoMiniPicUrl]];
    
    return self.cell;
}

@end
