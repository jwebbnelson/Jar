//
//  FineController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/12/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "FineController.h"
#import "Jar.h"
#import "Fine.h"

@interface FineController ()

@property (nonatomic,strong) PFQuery *query;

@end

@implementation FineController

+ (FineController *)sharedInstance {
    static FineController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FineController alloc] init];
    });
    return sharedInstance;
}

-(void)addFineWithDescription:(NSString *)description nark:(PFUser *)nark jar:(Jar *)jar fee:(NSNumber *)fee {
    
//    PFObject *fine = [Fine currentFine];

    
    [Fine currentFine][@"Jar"] = jar;
    [Fine currentFine][@"Nark"] = nark;
    [Fine currentFine][@"Fee"] = fee;
    [Fine currentFine][@"Description"] = description;
    
    [[Fine currentFine] saveInBackground];
}

-(NSNumber *)fineTotal {
    self.query = [Fine query];
    
    [self.query whereKey:@"Jar" equalTo:[Jar currentJar]];
    
    NSArray *objects = [self.query findObjects];
    
    NSNumber *fineSum = [objects valueForKeyPath:@"@sum.Fee"];
    
    return fineSum;
}
@end
