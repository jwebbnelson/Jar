//
//  JarController.h
//  JarApp
//
//  Created by Jordan Nelson on 3/11/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Jar.h"

@interface JarController : NSObject

@property (nonatomic, strong, readonly) NSArray *jars;
@property (nonatomic, readwrite) float fineTotal;
@property (nonatomic, strong) PFQuery *queryFines;

+ (JarController *)sharedInstance;

- (void)addJarWithTitle:(NSString *)title;
- (void)deleteJar:(PFObject *)jarObject;
- (void)deleteFines:(PFObject *)finesObject;

@end
