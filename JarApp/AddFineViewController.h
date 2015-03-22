//
//  AddFineViewController.h
//  JarApp
//
//  Created by Jake Herrmann on 3/7/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASValueTrackingSlider.h"
#import "Jar.h"

@interface AddFineViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *baseView;

@property (strong, nonatomic) IBOutlet UITextField *perpTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (readwrite, nonatomic) IBOutlet ASValueTrackingSlider *fineSlider;

-(void) updateJar:(Jar *) jar;

@end
