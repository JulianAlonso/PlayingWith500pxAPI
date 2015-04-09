//
//  CoreDataManager.m
//  PlayingWith500px
//
//  Created by Julian Alonso on 9/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CoreDataManager.h"
#import "CoreDataStack.h"

@implementation CoreDataManager

+ (NSManagedObjectContext *)privateManagedObjectContext
{
    NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    managedObjectContext.persistentStoreCoordinator = [[CoreDataManager coreDataStack] persistentStoreCoordinator];
    return managedObjectContext;
}

#pragma mark - Lazy Getter methods.
+ (CoreDataStack *)coreDataStack
{
    static CoreDataStack *coreDataStack;
    if (!coreDataStack)
    {
        coreDataStack = [[CoreDataStack alloc] init];
    }
    return coreDataStack;
}

@end
