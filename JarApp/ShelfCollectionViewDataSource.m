//
//  ShelfCollectionViewDataSource.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "ShelfCollectionViewDataSource.h"
#import "ShelfCollectionViewCell.h"
#import <Parse/Parse.h>

@interface ShelfCollectionViewDataSource ()

@property (nonatomic, strong) PFQuery *query;


@end

@implementation ShelfCollectionViewDataSource

-(instancetype)init {
    self = [super init];
    if (self){
        self.query =[PFQuery queryWithClassName:@"Jar"];
    }
    return  self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return (NSInteger)[self.query countObjects];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ShelfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    NSArray *objects = [self.query findObjects];
    PFObject *object = [objects objectAtIndex:indexPath.row];
    cell.titleLabel.text = object[@"Title"];
//    self.amountLabel.text = object[@"]
    
    return cell;

}




@end
