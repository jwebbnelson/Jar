//
//  AddingMembersViewController.h
//  JarApp
//
//  Created by Jordan Nelson on 3/20/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jar.h"

@interface AddingMembersViewController : UIViewController <UITableViewDataSource>

- (void)updateWithJar:(Jar *)jar;

@end
