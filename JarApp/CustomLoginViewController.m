//
//  CustomLoginViewController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/15/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "CustomLoginViewController.h"

@interface CustomLoginViewController ()

@end

@implementation CustomLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"JarBackground"]]];
//    
//    if (![[PFUser currentUser].username isEqualToString:@""] && [PFUser currentUser]) {
//        [self performSegueWithIdentifier:@"loggedIn" sender:self];
//    }
}

-(void)viewDidAppear:(BOOL)animated{
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logIn:(id)sender {
    [self checkFieldsComplete];
    
    [self performSegueWithIdentifier:@"loggedIn" sender:self];
    
}

-(void)checkFieldsComplete {
    if ([self.usernameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoahh there" message:@"You must complete all fields to login" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    };
}


- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}





@end
