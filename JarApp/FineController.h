//
//  FineController.h
//  JarApp
//
//  Created by Jordan Nelson on 3/12/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Fine.h"
#import "Jar.h"

@interface FineController : NSObject

+(FineController *)sharedInstance;

-(void)addFineWithDescription:(NSString *)description nark:(PFUser *)nark jar:(Jar *)jar fee:(NSNumber *)fee;
-(NSNumber *)fineTotal:(Jar *)jar;

@end
