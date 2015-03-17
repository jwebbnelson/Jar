//
//  MemberController.h
//  JarApp
//
//  Created by Jake Herrmann on 3/16/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberController : NSObject

@property (strong, nonatomic)NSArray *users;
-(void)searchForMembersWithUsername:(NSString *)username completion:(void(^)(BOOL success))completion;



+ (MemberController*)sharedInstance;


@end
