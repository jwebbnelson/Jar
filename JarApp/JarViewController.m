//
//  JarViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "JarViewController.h"
#import "AddFineViewController.h"
#import "JarController.h"
#import "JarTableViewCell.h"
#import "AddPerpViewController.h"

@interface JarViewController () <UITableViewDelegate>

@property (strong, nonatomic) NSString *label;
@property (nonatomic,strong) Jar *jar;

@end

@implementation JarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newFineReload) name:@"fineReload" object:nil];
    
    UIBarButtonItem *addMembers = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"addMembers"] style:UIBarButtonItemStylePlain target:self action:@selector(addFines)];
    [self.navigationItem setRightBarButtonItem:addMembers];
    
    self.totalLabel.text = self.label;
}
- (void)updateWithJar:(Jar *)jar {
    self.jar = jar;
   // [[JarController sharedInstance] loadFines:self.jar];
    
    self.label = [NSString stringWithFormat:@"$%.2f", [[[JarController sharedInstance] fineTotal:self.jar] floatValue]];
    
    //[NSString stringWithFormat:@"%@",self.jar[@"Total"];
}

- (IBAction)deleteJar:(id)sender {
    //Notification from bottom asking if "you're sure to delete the Jar?"
    UIAlertController *deleteController = [UIAlertController alertControllerWithTitle:@"DELETE JAR" message:@"Are you sure you want to delete this JAR and its Fines?" preferredStyle:UIAlertControllerStyleActionSheet];
    [deleteController addAction:[UIAlertAction actionWithTitle:@"DELETE" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        //delete from Parse >> PUT CODE HERE
        if (self.jar) {
            [[JarController sharedInstance]deleteFines:self.jar];
            NSLog(@"DELETED FINES");
        }
        [[JarController sharedInstance]deleteJar:self.jar];
        NSLog(@"DELETED JAR");
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }]];
    [deleteController addAction:[UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        return; //Cancel the action
    }]];
    
    [self presentViewController:deleteController animated:YES completion:nil];
    
}
- (void)newFineReload {
    
    self.label = [NSString stringWithFormat:@"$%.2f", [[[JarController sharedInstance] fineTotal:self.jar ] floatValue]];
    
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //Alert Controller for voting
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Details" message:@"Jake fined Jordan for not doing dishes" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Fair" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self votedFair];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Not Fair" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Voted Not Fair");
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler: nil]];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)votedFair{
    //Confirmation of voting.
    UIAlertController *detailAlertController = [UIAlertController alertControllerWithTitle:@"You Voted Fair" message:@"Are you sure you want to fine them?" preferredStyle:UIAlertControllerStyleAlert];
    
    [detailAlertController addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil]];
    [detailAlertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:detailAlertController animated:YES completion:nil];
    
}
- (void)addFines {
    AddFineViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"AddFineVC"];

    AddPerpViewController *perpVC = [AddPerpViewController new];
    [perpVC updateJar:self.jar];
    
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


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jarCell" forIndexPath:indexPath];
    
    Jar *jar = [[JarController sharedInstance] jars][self.index];

    Fine *fine = jar[@"Fines"][indexPath.row];
    
    //TableViewCell text with Fee, Perp and Description.
    cell.textLabel.text = [NSString stringWithFormat:@"$%@ - %@", fine[@"Fee"], fine[@"Perp"]];
    cell.detailTextLabel.text = fine[@"Description"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *fineAmount = [JarController sharedInstance].jars[self.index][@"Fines"];
    return  fineAmount.count;
}

@end
