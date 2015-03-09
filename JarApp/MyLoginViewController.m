//
//  MyLoginViewController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/9/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "MyLoginViewController.h"

@interface MyLoginViewController ()

@end

@implementation MyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.logInView setBackgroundColor:[UIColor colorWithRed:0.36 green:0.79 blue:0.86 alpha:1]];
    [self.logInView.signUpButton setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
