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

- (NSArray *)jars {
    PFQuery *query = [Jar query];
    [query fromLocalDatastore];
    return [query findObjects];
}


-(void)addJarWithTitle:(NSString *)title {
    
    Jar *jar = [Jar objectWithClassName:@"Jar"];
    jar[@"Title"] = title;

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

-(void)addMembersToJar:(NSArray *)array{
    for (PFUser *user in array) {
        
        PFACL *ACL = [PFACL ACLWithUser:[PFUser currentUser]];
        [ACL setWriteAccess:YES forUserId:user.objectId];
        
        [Jar currentJar].ACL = ACL;
    }
    
}

- (void)deleteFines:(PFObject *)finesObject{
    self.queryFines = [PFQuery queryWithClassName:@"Fine"];
    [_queryFines whereKey:@"Jar" equalTo:finesObject];
    [finesObject deleteInBackground];
    
}

@end
