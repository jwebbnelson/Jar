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
#import "Jar.h"
#import <Parse/Parse.h>

@interface JarTableViewDataSource()

@property (readwrite, nonatomic) NSInteger count;
@property (strong, nonatomic) PFQuery *query;

@end

@implementation JarTableViewDataSource

-(instancetype)init {
    self = [super init];
    if (self){
        self.query =[PFQuery queryWithClassName:@"Fine"];
    }
    return  self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     JarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jarCell" forIndexPath:indexPath];
   
    [self.query whereKey:@"Jar" equalTo:[Jar currentJar]];
    [self.query orderByDescending:@"createdAt"];

    NSArray *objects = [self.query findObjects];
    PFObject *object = [objects objectAtIndex:indexPath.row];
    cell.textLabel.text = object[@"Perp"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@",object[@"Fee"]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [self.query whereKey:@"Jar" equalTo:[Jar currentJar]];
    return (NSInteger)[self.query countObjects];
}

@end
