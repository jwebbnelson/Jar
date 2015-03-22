//
//  JarController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/11/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "JarController.h"


@interface JarController ()

@end

@implementation JarController

+ (JarController *)sharedInstance {
    static JarController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JarController alloc] init];
        [sharedInstance loadJars];
    });
    return sharedInstance;
}

-(void)loadJars {
    PFQuery *query = [Jar query];
   
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (Jar *jar in objects) {
            [jar pin];
        }
    [[NSNotificationCenter defaultCenter]postNotificationName:@"jarReload" object:nil];
    }];
}

// All Jars
- (NSArray *)jars {
    PFQuery *query = [Jar query];
    [query fromLocalDatastore];
    return [query findObjects];
}

// Adding Jar
-(void)addJarWithTitle:(NSString *)title {
    
    Jar *jar = [Jar objectWithClassName:@"Jar"];
    jar[@"Title"] = title;
    jar[@"Total"] = @"$0.00";
    [jar pinInBackground];
    [jar save];
}

- (void)deleteJar:(Jar *)jar {
    [jar unpinInBackground];
    [jar deleteInBackground];
}

-(void)updateJar:(Jar *)jar {
    [jar pinInBackground];
    [jar save];
}


// Fines
-(void)loadFines:(Jar *)jar {
    PFQuery *query = [Fine query];
    
    [query whereKey:@"Jar" equalTo:jar.name];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (Fine *fine in objects) {
            [fine pin];
        }
        [[NSNotificationCenter defaultCenter]postNotificationName:@"fineReload" object:nil];
    }];
}

-(void)addNewFine:(Fine*)fine ToJar:(Jar *)jar {
    NSMutableArray *array = jar[@"Fines"];
    [array addObject:fine];
    jar[@"Fines"] = array;
    
    [jar pinInBackground];
    [jar save];
}


-(void)addFineWithDescription:(NSString *)description nark:(PFUser *)nark jar:(Jar *)jar fee:(NSNumber *)fee {
    
    Fine *fine = [Fine objectWithClassName:@"Fine"];
    
    fine[@"Jar"] = jar;
    fine[@"Nark"] = nark;
    fine[@"Fee"] = fee;
    fine[@"Description"] = description;
    
    [fine pinInBackground];
    [fine save];
}

// All Fines for Jar
- (NSArray *)fines:(Jar *)jar {
    PFQuery *query = [Fine query];
    [query whereKey:@"Jar" equalTo:jar.name];
    [query orderByDescending:@"createdAt"];
    [query fromLocalDatastore];
    return [query findObjects];
}

-(NSNumber *)fineTotal:(Jar *)jar {
    PFQuery *query = [Fine query];
    
    [query whereKey:@"Jar" equalTo:jar];
    
    NSArray *objects = [query findObjects];
    
    NSNumber *fineSum = [objects valueForKeyPath:@"@sum.Fee"];
    
    return fineSum;
}


/////
-(void)addMembersToJar:(NSArray *)array{
    for (PFUser *user in array) {
        
        PFACL *ACL = [PFACL ACLWithUser:[PFUser currentUser]];
        [ACL setWriteAccess:YES forUserId:user.objectId];
        
   //     [Jar currentJar].ACL = ACL;
    }
    
}

- (void)deleteFines:(PFObject *)finesObject{
    self.queryFines = [PFQuery queryWithClassName:@"Fine"];
    [_queryFines whereKey:@"Jar" equalTo:finesObject];
    [finesObject deleteInBackground];
    
}

@end
