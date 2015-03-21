//
//  AddPerpViewController.m
//  JarApp
//
//  Created by Jake Herrmann on 3/17/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "AddPerpViewController.h"
#import "Jar.h"
#import "JarController.h"
#import "Fine.h"

@interface AddPerpViewController () <UITableViewDelegate>



@end

@implementation AddPerpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateJar:(Jar *)jar {
    self.jar = jar;
}

-(NSArray *)memberQuery{
    return self.jar[@"MemberUsernames"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"perpCell"];
    cell.textLabel.text = [self memberQuery][indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self memberQuery].count;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[Fine currentFine] setObject:[self memberQuery][indexPath.row]forKey:@"Perp"];
    [[Fine currentFine] saveInBackground];
    [self.navigationController popViewControllerAnimated:YES];
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
