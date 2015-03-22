//
//  JarViewController.h
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jar.h"
@interface JarViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (nonatomic, readwrite) NSInteger index;

- (void)updateWithJar:(Jar *)jar;

@end
