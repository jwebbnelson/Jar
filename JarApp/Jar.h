//
//  Jar.h
//  JarApp
//
//  Created by Jordan Nelson on 3/10/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <Parse/Parse.h>

@interface Jar : PFObject <PFSubclassing>

@property (nonatomic,strong) NSString *name;

+(NSString *)parseClassName;

+ (void)setCurrentJar:(Jar *)jar;

+ (NSString *)jarID:(Jar*)jar;


@end