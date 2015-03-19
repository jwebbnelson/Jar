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
#import "Jar.h"
#import "JarController.h"

@interface ShelfCollectionViewDataSource ()

@property (nonatomic, strong) PFQuery *query;
@property (nonatomic, strong) PFObject *indexObject;
@property (nonatomic, strong) NSArray *objects;


@end

@implementation ShelfCollectionViewDataSource

-(instancetype)init {
    self = [super init];
    if (self){

    }
    return  self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return (NSInteger)[self.query countObjects];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ShelfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    Jar *jar = [[JarController sharedInstance].jars objectAtIndex:indexPath.item];
    
    cell.titleLabel.text = jar[@"Title"];
    cell.cashLabel.text = jar[@"Total"];
    [cell.contentView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Cell"]]];

    return cell;
}

- (IBAction)deleteJar:(id)sender {
    //This action will start when a longPressGesture at a cell on the CollectionView.
    UILongPressGestureRecognizer *delete = [UILongPressGestureRecognizer new];
    delete = sender;
    
    if (delete.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Began");
    }else if (delete.state == UIGestureRecognizerStateEnded) {
        
  //      ShelfViewController *viewController = [ShelfViewController new];
//        #error Need to identify the indexPath of the cell selected.
//      [viewController deleteJarWithID:self.indexObject];
        
    }
    
}




@end
