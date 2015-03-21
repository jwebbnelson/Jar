//
//  AddPerpViewController.h
//  JarApp
//
//  Created by Jake Herrmann on 3/17/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jar.h"

@interface AddPerpViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) Jar *jar;

-(void)updateJar:(Jar *)jar;

@end
