//
//  JarController.h
//  JarApp
//
//  Created by Jordan Nelson on 3/11/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

#import "Fine.h"
#import "Jar.h"

@interface JarController : NSObject

@property (nonatomic, strong, readonly) NSArray *jars;
@property (nonatomic, readwrite)NSNumber *fineTotal;

+ (JarController *)sharedInstance;

-(void)addJarWithTitle:(NSString *)title;

-(void)addFineWith:(NSString *)perp description:(NSString *)description nark:(PFUser *)nark jar:(Jar *)jar fee:(NSNumber *)fee;

-(NSNumber *)fineTotal;


@end
