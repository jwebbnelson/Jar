//
//  ShelfCollectionViewDataSource.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "ShelfCollectionViewDataSource.h"
#import "ShelfCollectionViewCell.h"
#import "ShelfViewController.h"
#import <Parse/Parse.h>
#import <stdlib.h>

@interface ShelfCollectionViewDataSource ()

@property (nonatomic, strong) PFQuery *query;
@property (nonatomic, strong) PFObject *indexObject;


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
    self.indexObject = [objects objectAtIndex:indexPath.row];
    cell.titleLabel.text = self.indexObject[@"Title"];
    
    return cell;

}

- (IBAction)deleteJar:(id)sender {
    
    UILongPressGestureRecognizer *delete = [UILongPressGestureRecognizer new];
    delete = sender;
    
    if (delete.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Began");
    }else if (delete.state == UIGestureRecognizerStateEnded) {
        
        ShelfViewController *viewController = [ShelfViewController new];
        #error Need to identify the indexPath of the cell selected.
//      [viewController deleteJarWithID:self.indexObject];
        
    }
    
}




@end
