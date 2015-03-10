//
//  JarTableViewDataSource.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "JarTableViewDataSource.h"
#import "JarTableViewCell.h"
#import "JarViewController.h"
#import <Parse/Parse.h>

@interface JarTableViewDataSource()

@property (readwrite, nonatomic) NSInteger count;

@end

@implementation JarTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jarCell" forIndexPath:indexPath];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    PFQuery *query = [PFQuery queryWithClassName:@"Fine"];
    return (NSInteger)[query countObjects];
}
@end
