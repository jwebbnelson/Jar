//
//  NewJarViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "NewJarViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "JarController.h"
#import "AddingMembersViewController.h"

@interface NewJarViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UIButton *createJarButton;
@property (strong, nonatomic) Jar *jar;

@end

@implementation NewJarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissPopOver:(id)sender {
    self.view.alpha = 0;
    [[self navigationController]setNavigationBarHidden:NO];
    [self willMoveToParentViewController:nil];

}
- (IBAction)createJar:(id)sender {    
    [[JarController sharedInstance] addJarWithTitle:self.nameTextField.text];
    
    self.jar = [[[JarController sharedInstance] jars] lastObject];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"jarReload" object:nil];
    
    [self dismissPopOver:nil];
    [self performSegueWithIdentifier:@"AddingMembersSegue" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddingMembersViewController *vc = (AddingMembersViewController *)[segue destinationViewController];
    [vc updateWithJar:self.jar];
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
