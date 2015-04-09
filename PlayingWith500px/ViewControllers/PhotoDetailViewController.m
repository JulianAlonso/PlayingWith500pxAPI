//
//  PhotoDetailViewController.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "Photo.h"

@interface PhotoDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *photoNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoCameraLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoApertureLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatarImageView;

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Config methods.
- (void)configItems
{
    self.photoNameLabel.text = self.photo.photoName;
    self.photoDescriptionLabel.text = self.photo.photoDescription;
    self.photoCameraLabel.text = self.photo.photoCamera;
    self.photoApertureLabel.text = self.photo.photoAperture;
}

@end
