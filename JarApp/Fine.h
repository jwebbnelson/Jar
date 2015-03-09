//
//  Fine.h
//  JarApp
//
//  Created by Jordan Nelson on 3/9/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <Parse/Parse.h>

@interface Fine : PFObject

@property (nonatomic, strong) NSString *perp;
@property (nonatomic, readwrite) CGFloat fineAmount;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDate *dateCreated;

@end
