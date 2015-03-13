//
//  AddFineViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/7/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "AddFineViewController.h"
#import "Fine.h"
#import "JarViewController.h"
#import "Jar.h"
#import "JarController.h"

@interface AddFineViewController () <UITextFieldDelegate>

@property (nonatomic, strong) NSNumber *stepperValue;

@end

@implementation AddFineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.stepperValue = [NSNumber numberWithInt:1];
   
    self.baseView.alpha = 1.0;
//    [self.baseView setAlpha:.5];
}



- (IBAction)sliderChanged:(id)sender {
    float sliderValue = self.fineSlider.value;
    NSString *numberString = [NSString stringWithFormat:@"%.2f",sliderValue];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    self.stepperValue = [formatter numberFromString:numberString];
}


- (IBAction)closePopUp:(id)sender {
    self.view.alpha = 0;
    [[self navigationController]setNavigationBarHidden:NO];
    [self willMoveToParentViewController:nil];
}

- (IBAction)submitFine:(id)sender {

    [[JarController sharedInstance] addFineWith:self.perpTextField.text description:self.descriptionTextField.text nark:[PFUser currentUser] jar:[Jar currentJar] fee:self.stepperValue];

    [[NSNotificationCenter defaultCenter]postNotificationName:@"fineReload" object:nil];
    
    [self.descriptionTextField resignFirstResponder];
    self.view.alpha = 0;
    [[self navigationController]setNavigationBarHidden:NO];
    [self willMoveToParentViewController:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
