//
//  FiveHungredpxExternalPhotosProvider.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExternalPhotosProvider.h"
#import "RequestManager.h"

@interface FiveHungredpxExternalPhotosProvider : NSObject <ExternalPhotosProvider>

@property (nonatomic, strong) id<RequestManager> requestManager;

@end
