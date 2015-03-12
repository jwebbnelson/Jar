//
//  JarController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/11/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "JarController.h"
#import "Jar.h"
#import <Parse/Parse.h>

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
    // [query fromLocalDatastore];
    return [query findObjects];
}


-(void)addJarWithTitle:(NSString *)title {
    PFObject *jar = [PFObject objectWithClassName:@"Jar"];
    jar[@"Title"] = title;
    
    [jar saveInBackground];
    
}
@end
