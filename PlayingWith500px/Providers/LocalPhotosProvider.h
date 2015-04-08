//
//  LocalPhotosProvider.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LocalPhotosProvider <NSObject>

- (void)loadStoredPhotosWithCompletion:(void(^)(NSArray *photos))completion;

@end
