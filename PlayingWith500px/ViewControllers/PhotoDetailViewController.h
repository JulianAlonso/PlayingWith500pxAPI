//
//  PhotoDetailViewController.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotoDetailRouter;
@class Photo;

@interface PhotoDetailViewController : UIViewController

@property (nonatomic, strong) PhotoDetailRouter *router;
@property (nonatomic, strong) Photo *photo;


@end
