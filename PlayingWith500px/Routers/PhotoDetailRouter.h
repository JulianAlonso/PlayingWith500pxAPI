//
//  PhotoDetailRouter.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface PhotoDetailRouter : NSObject

- (void)pushFromNavigationController:(UINavigationController *)navigationController withPhoto:(Photo *)photo;

@end
