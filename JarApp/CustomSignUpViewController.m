//
//  CustomSignUpViewController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/15/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "CustomSignUpViewController.h"

@interface CustomSignUpViewController ()

@end

@implementation CustomSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"JarBackground"]]];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)backgoundTap:(id)sender {
        [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUp:(id)sender {
    
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    
    [self registerNewUser];
}

-(void)registerNewUser {
    
    PFUser *user = [PFUser user];
    
    user.username = self.usernameTextField.text;
    user.email = self.emailTextField.text;
    user.password = self.passwordTextField.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error){
            [self performSegueWithIdentifier:@"signedUp" sender:self];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@",errorString);
        }
    }];
}


@end
