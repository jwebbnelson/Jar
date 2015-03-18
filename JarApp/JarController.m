//
//  JarController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/11/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "JarController.h"
#import "Jar.h"

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

    [query whereKey:@"ACL" equalTo:[PFUser currentUser]];

    return [query findObjects];
}

-(void)addJarWithTitle:(NSString *)title {
    Jar *jar = [Jar objectWithClassName:@"Jar"];
    jar[@"Title"] = title;
    [Jar setCurrentJar:jar];
    [jar saveInBackground];
    
}

-(void)addMembersToJar:(NSArray *)array{
    for (PFUser *user in array) {
        
        PFACL *ACL = [PFACL ACLWithUser:[PFUser currentUser]];
        [ACL setWriteAccess:YES forUserId:user.objectId];
        
        [Jar currentJar].ACL = ACL;
    }
    
}
- (void)deleteJar:(PFObject *)jarObject {
        PFObject *jar = [PFObject objectWithClassName:@"Jar"];
        jar = jarObject;
        [jarObject deleteInBackground];
        
    }

- (void)deleteFines:(PFObject *)finesObject{
    self.queryFines = [PFQuery queryWithClassName:@"Fine"];
    [_queryFines whereKey:@"Jar" equalTo:finesObject];
    [finesObject deleteInBackground];
    
}

@end
