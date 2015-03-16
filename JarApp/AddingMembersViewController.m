//
//  AddingMembersViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/14/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "AddingMembersViewController.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@interface AddingMembersViewController ()

@property (nonatomic) NSArray *users;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AddingMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    PFQuery *query = [PFUser query];
    [query setLimit:1000];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.users = objects;
            NSLog(@"%@",self.users);
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    PFUser *user = self.users[indexPath.row];
    cell.textLabel.text = user.username;
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.users count];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
