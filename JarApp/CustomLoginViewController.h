//
//  CustomLoginViewController.h
//  JarApp
//
//  Created by Jordan Nelson on 3/15/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h> 

@interface CustomLoginViewController : UIViewController <PFLogInViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end
