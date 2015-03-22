//
//  AddingMembersViewController.m
//  JarApp
//
//  Created by Jordan Nelson on 3/20/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "AddingMembersViewController.h"
#import "AddingMembersTableViewCell.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import "MemberController.h"
#import "JarController.h"


@interface AddingMembersViewController () <UISearchBarDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray* allTableData;
@property (strong, nonatomic) NSMutableArray* filteredTableData;
@property (nonatomic, strong) Jar *jar;
@property (nonatomic) NSArray *users;
@property(readwrite, nonatomic)BOOL isFiltered;

@end

@implementation AddingMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *addMembers = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"addMembers"] style:UIBarButtonItemStylePlain target:self action:@selector(addMembers)];
    [self.navigationItem setRightBarButtonItem:addMembers];
    
    self.tableView.allowsMultipleSelection = YES;
    self.searchBar.delegate = (id)self;
}

- (void)updateWithJar:(Jar *)jar{
    self.jar = jar;
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

-(void)addMembers{
    NSArray *selectedCells = [self.tableView indexPathsForSelectedRows];
    NSMutableArray *usersArray = [NSMutableArray new];
    NSMutableArray *usernameArray = [NSMutableArray new];
    PFUser *user;
    NSString *username;
    for (NSIndexPath *indexPath in selectedCells) {
        user = [self.users objectAtIndex:indexPath.row];
        username = user.username;
        [usersArray addObject:user];
        [usernameArray addObject:username];
    }
    
    self.jar[@"Members"] = usersArray;
    self.jar[@"MemberUsernames"] = usernameArray;
   
    [[JarController sharedInstance] updateJar:self.jar];
    //[[JarController sharedInstance] addMembersToJar:usersArray];
   
    [self performSegueWithIdentifier:@"addMembers" sender:nil];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0)
    {
        self.isFiltered = NO;
    }
    else
    {
        self.isFiltered = YES;
        self.filteredTableData = [[NSMutableArray alloc] init];
        
        for (PFUser* user in self.users)
        {
            NSRange nameRange = [user.username rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [self.filteredTableData addObject:user];
            }
        }
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"userCell";
    AddingMembersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    PFUser* user;
    if(self.isFiltered){
        user = [self.filteredTableData objectAtIndex:indexPath.row];
    }else{
        user = [self.users objectAtIndex:indexPath.row];
    }
    
    cell.usernameLabel.text = user.username;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowCount;
    
    if(self.isFiltered)
        rowCount = self.filteredTableData.count;
    else
        rowCount = self.users.count;
    
    return rowCount;
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