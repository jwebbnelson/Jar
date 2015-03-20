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
    self.usernameTextField.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"JarBackground"]];
   
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
   
    if ([self checkFieldsComplete]){
    
    PFUser *user = [PFUser user];
    user.username = self.usernameTextField.text;
    user.password = self.passwordTextField.text;
 
    [PFUser logInWithUsernameInBackground:user.username password:user.password block:^(PFUser *user, NSError *error) {
        if (!error) {
            [self performSegueWithIdentifier:@"loggedIn" sender:self];
        }
        else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@",errorString);
        }
    }];
    }
    
}

-(BOOL)checkFieldsComplete {
    if ([self.usernameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoahh there" message:@"You must complete all fields to login" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert setTintColor:[UIColor whiteColor]];
        [alert show];
        return NO;
    };
    return YES;
}


- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}





@end
