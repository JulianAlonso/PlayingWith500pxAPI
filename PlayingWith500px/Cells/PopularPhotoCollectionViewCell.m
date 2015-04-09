//
//  PopularPhotoCollectionViewCell.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PopularPhotoCollectionViewCell.h"

@implementation PopularPhotoCollectionViewCell

- (void)awakeFromNib
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - Action methods.
- (void)tapped:(UITapGestureRecognizer *)sender
{
    [self.delegate didTapAtPopularPhotoCollectionViewCell:self];
}

@end
