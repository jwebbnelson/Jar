//
//  JarController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/11/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "JarController.h"

@interface JarController ()


@property (nonatomic,strong) PFQuery *query;

@end

@implementation JarController

+ (JarController *)sharedInstance {
    static JarController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JarController alloc] init];
    });
    return sharedInstance;
}

-(NSArray *)jars {
    PFQuery *query = [Jar query];
    return [query findObjects];
}

-(void)addJarWithTitle:(NSString *)title {
    PFObject *jar = [PFObject objectWithClassName:@"Jar"];
    jar[@"Title"] = title;
    
    [jar saveInBackground];
    
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


-(NSNumber *)fineTotal {
    self.query = [Fine query];
    
    [self.query whereKey:@"Jar" equalTo:[Jar currentJar]];
    
    NSArray *objects = [self.query findObjects];
    
    NSNumber *fineSum = [objects valueForKeyPath:@"@sum.Fee"];
    
    return fineSum;
}

@end
