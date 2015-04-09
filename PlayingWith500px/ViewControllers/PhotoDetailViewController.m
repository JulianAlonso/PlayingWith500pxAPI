//
//  PhotoDetailViewController.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "PhotoDetailViewController.h"

@interface PhotoDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *photoNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoApertureLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatarImageView;

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
