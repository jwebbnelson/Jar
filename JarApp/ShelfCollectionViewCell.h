//
//  ShelfCollectionViewCell.h
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShelfCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *cashLabel;

@end
