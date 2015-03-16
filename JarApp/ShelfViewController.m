//
//  ShelfViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "ShelfViewController.h"
#import "ShelfCollectionViewCell.h"
#import "NewJarViewController.h"
#import "JarViewController.h"
#import <Parse/Parse.h>
#import "Jar.h"

@interface ShelfViewController () <UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) PFQuery *query;

@end

@implementation ShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newJarReload) name:@"jarReload" object:nil];
    
    self.query =[PFQuery queryWithClassName:@"Jar"];

}
- (void)deletItemsFromDataSourceAtIndexPath:(NSArray *)itemPaths {
    
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    
    for (NSIndexPath *indexPath in itemPaths) {
        [indexSet addIndex:indexPath.row];
    }
}
- (void)newJarReload {
    [self.collectionView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButtonSelected:(id)sender {
    NewJarViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"addJarVC"];
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
    viewController.view.alpha = 0.8;
    [[self navigationController] setNavigationBarHidden:YES];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSArray *objects = [self.query findObjects];
    Jar *jars = [objects objectAtIndex:indexPath.row];
    [Jar setCurrentJar:jars];
    
}

@end
