//
//  PhotoDetailViewController.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "Photo.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "User.h"

@interface PhotoDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *photoNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoCameraLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoApertureLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatarImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidthConstraint;

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.imageWidthConstraint.constant = CGRectGetWidth(self.view.frame);
}

#pragma mark - Config methods.
- (void)configItems
{
    [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:self.photo.photoBigPicUrl]];
    self.photoNameLabel.text = self.photo.photoName;
    self.photoDescriptionLabel.text = self.photo.photoDescription;
    self.photoCameraLabel.text = self.photo.photoCamera;
    self.photoApertureLabel.text = self.photo.photoAperture;
    self.userNameLabel.text = self.photo.photoUser.userName;
    [self.userAvatarImageView sd_setImageWithURL:[NSURL URLWithString:self.photo.photoUser.userAvatarURL]];
}

@end
