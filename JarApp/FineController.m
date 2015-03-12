//
//  FineController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/12/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "FineController.h"


@implementation FineController

+ (FineController *)sharedInstance {
    static FineController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FineController alloc] init];
    });
    return sharedInstance;
}

-(void)addFineWith:(NSString *)perp description:(NSString *)description nark:(PFUser *)nark jar:(Jar *)jar fee:(NSNumber *)fee {
    
    PFObject *fine = [PFObject objectWithClassName:@"Fine"];
    
    fine[@"Jar"] = jar;
    fine[@"Perp"] = perp;
    fine[@"Nark"] = nark;
    fine[@"Fee"] = fee;
    fine[@"Description"] = description;
    
    [fine saveInBackground];
}

@end
