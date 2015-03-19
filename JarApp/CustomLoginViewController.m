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
    
   
}

-(void)viewDidAppear:(BOOL)animated{
    if ([PFUser currentUser].username != nil) {
        [self performSegueWithIdentifier:@"loggedIn" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logIn:(id)sender {
    //[self logIn:[PFUser user]];

    [self checkFieldsComplete];
    
}

-(void)checkFieldsComplete {
    if ([self.usernameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoahh there" message:@"You must complete all fields to login" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    };
 //   [self checkPasswordsMatch];
    
    
}








@end
