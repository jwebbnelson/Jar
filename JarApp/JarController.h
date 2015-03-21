//
//  JarController.h
//  JarApp
//
//  Created by Jordan Nelson on 3/11/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Jar.h"
#import "Fine.h"

@interface JarController : NSObject

@property (nonatomic, strong)PFQuery *queryFines;
@property (nonatomic, strong) NSArray *jars;
@property (nonatomic, readwrite) float fineTotal;

+ (JarController *)sharedInstance;

- (void)deleteFines:(PFObject *)finesObject;
-(void)addJarWithTitle:(NSString *)title;
-(void)addMembersToJar:(NSArray *)array;
-(void)deleteJar:(PFObject *)jarObject;
-(void)updateJar:(Jar *)jar;

-(void)addFineWithDescription:(NSString *)description nark:(PFUser *)nark jar:(Jar *)jar fee:(NSNumber *)fee;
-(NSNumber *)fineTotal:(Jar *)jar;
-(void)loadFines:(Jar *)jar;
- (NSArray *)fines:(Jar *)jar;

@end
