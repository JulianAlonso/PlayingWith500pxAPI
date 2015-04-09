//
//  UserMO.h
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PhotoMO;

@interface UserMO : NSManagedObject

@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userAvatarURL;
@property (nonatomic, retain) NSSet *userPhotos;
@end

@interface UserMO (CoreDataGeneratedAccessors)

- (void)addUserPhotosObject:(PhotoMO *)value;
- (void)removeUserPhotosObject:(PhotoMO *)value;
- (void)addUserPhotos:(NSSet *)values;
- (void)removeUserPhotos:(NSSet *)values;

@end
