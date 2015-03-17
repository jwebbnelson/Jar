//
//  MemberController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/16/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "MemberController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface MemberController () 

@end

@implementation MemberController


+ (MemberController*)sharedInstance {
    static MemberController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MemberController new];
    });
    
    return sharedInstance;
}

-(void)searchForMembersWithUsername:(NSString *)username completion:(void(^)(BOOL success))completion{
    PFQuery *query = [PFUser query];
    [query setLimit:1000];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.users = objects;
            NSLog(@"%@",self.users);
        }
    }];

}

@end

    