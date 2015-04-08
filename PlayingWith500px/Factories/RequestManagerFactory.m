//
//  RequestManagerFactory.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "RequestManagerFactory.h"
#import "CustomRequestManager.h"

@implementation RequestManagerFactory

+ (id<RequestManager>)defaultRequestManager
{
    return [CustomRequestManager new];
}

@end
