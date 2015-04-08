//
//  URLHelper.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 8/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLHelper : NSObject

+ (NSURL *)urlWithString:(NSString *)url andParams:(NSDictionary *)params;

@end
