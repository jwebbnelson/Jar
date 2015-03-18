//
//  Fine.m
//  JarApp
//
//  Created by Jordan Nelson on 3/10/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "Fine.h"

static Fine * currentFine;

@implementation Fine

//@dynamic name;

 + (NSString *)parseClassName {
      return @"Fine";
  }

+ (Fine *)currentFine {
    return currentFine;
}

+ (void)setCurrentFine:(Fine *)fine {
    currentFine = fine;
}

@end
