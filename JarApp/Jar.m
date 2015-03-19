//
//  Jar.m
//  JarApp
//
//  Created by Jordan Nelson on 3/10/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "Jar.h"

static Jar * currentJar;

@interface Jar ()

@end

@implementation Jar

//@dynamic currentJar;
@dynamic name;

 + (NSString *)parseClassName {
      return @"Jar";
  }

+ (Jar *)currentJar {
    return currentJar;
}

+ (NSString *)jarID:(Jar*)jar{
    return [jar objectForKey:@"objectId"];
}

+ (void)setCurrentJar:(Jar *)jar {
    currentJar = jar;
}

@end
