//
//  ShelfViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "ShelfViewController.h"
#import "NewJarViewController.h"
#import <Parse/Parse.h>
#import "Jar.h"

@interface ShelfViewController () <UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) PFQuery *query;

@end

@implementation ShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newJarReload) name:@"jarReload" object:nil];
    
    self.query =[PFQuery queryWithClassName:@"Jar"];

    // Deleting TableViewCells
//    [self.collectionView performBatchUpdates:^{
//        NSArray *selectedItemsIndexPath = [self.collectionView indexPathsForSelectedItems];
//        [self deletItemsFromDataSourceAtIndexPath:selectedItemsIndexPath];
//        [self.collectionView deleteItemsAtIndexPaths:selectedItemsIndexPath];
//    } completion:nil];
//    
}

-(void)deletItemsFromDataSourceAtIndexPath:(NSArray *)itemPaths {
    
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSArray *objects = [self.query findObjects];
    Jar *jars = [objects objectAtIndex:indexPath.row];
    [Jar setCurrentJar:jars];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
