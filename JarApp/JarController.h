//
//  JarController.h
//  JarApp
//
//  Created by Jordan Nelson on 3/11/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>



@interface JarController : NSObject

@property (nonatomic, strong)PFQuery *queryFines;
@property (nonatomic, strong, readonly) NSArray *jars;
@property (nonatomic, readwrite) float fineTotal;

+ (JarController *)sharedInstance;

- (void)deleteFines:(PFObject *)finesObject;
-(void)addJarWithTitle:(NSString *)title;
-(void)addMembersToJar:(NSArray *)array;
-(void)deleteJar:(PFObject *)jarObject;

@end
