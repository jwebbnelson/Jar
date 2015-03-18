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
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newJarReload) name:@"jarReload" object:nil];
    
    self.query =[PFQuery queryWithClassName:@"Jar"];

}

-(void)viewDidAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"jarReload" object:nil];
}

- (void)deleteJarWithID:(NSIndexPath *)index {
    
    //Notification from bottom asking if "you're sure to delete the Jar?"
    
    UIAlertController *deleteController = [UIAlertController alertControllerWithTitle:@"Delete Jar" message:@"Are you sure you want to delete the Jar and its Fines?" preferredStyle:UIAlertControllerStyleActionSheet];
    [deleteController addAction:[UIAlertAction actionWithTitle:@"DELETE JAR" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"DELETE FROM PARSE THE JAR AND FINES");
        //delete from Parse >> PUT CODE HERE
    }]];
    [deleteController addAction:[UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        return; //Cancel the action
    }]];

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
