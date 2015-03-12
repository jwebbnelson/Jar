//
//  JarViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "JarViewController.h"
#import "AddFineViewController.h"
#import "FineController.h"

@interface JarViewController () <UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) NSString *label;

@end

@implementation JarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newFineReload) name:@"fineReload" object:nil];
    
    self.label = [NSString stringWithFormat:@"$%.2f", [[FineController sharedInstance].fineTotal floatValue]];
    
    self.totalLabel.text = self.label;

}

- (void)newFineReload {
    
     self.label = [NSString stringWithFormat:@"$%.2f", [[FineController sharedInstance].fineTotal floatValue]];
    
    [UIView animateWithDuration:1 animations:^{
        self.totalLabel.alpha = 0;
    } completion:^(BOOL finished) {
        self.totalLabel.text = self.label;
        [UIView animateWithDuration:2 animations:^{
            self.totalLabel.alpha = 1;
        }];
    }];
    
   // [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationMiddle];
    [UIView transitionWithView:self.tableView duration:.9f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.tableView reloadData];
    } completion:nil];
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
    viewController.view.transform = CGAffineTransformMakeScale(.7, .7);
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
