//
//  JarViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "JarViewController.h"
#import "AddFineViewController.h"

@interface JarViewController () <UITableViewDelegate>

@end

@implementation JarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Details" message:@"Jake fined Jordan for not doing dishes" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Fair" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self votedFair];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@" Not Fair" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Voted Not Fair");
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler: nil]];
 

    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)votedFair{
  UIAlertController *detailAlertController = [UIAlertController alertControllerWithTitle:@"You Voted Fair" message:@"Are you sure you want to fine them?" preferredStyle:UIAlertControllerStyleAlert];
   
    
    [detailAlertController addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil]];
    
    [detailAlertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:detailAlertController animated:YES completion:nil];
    
}
- (IBAction)addButtonSelected:(id)sender {
    AddFineViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"AddFineVC"];
    
    [self addChildViewController:viewController];
    viewController.view.transform = CGAffineTransformMakeScale(.5, .5);
    [self.view addSubview:viewController.view];
    
    [viewController didMoveToParentViewController:self];
    viewController.baseView.alpha = 0.8;
    [[self navigationController] setNavigationBarHidden:YES];
    
    [UIView animateWithDuration:0.4 animations:^{
        viewController.view.transform = CGAffineTransformMakeScale(1, 1);
    }];
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
