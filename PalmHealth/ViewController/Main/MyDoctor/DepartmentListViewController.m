//
//  DepartmentListViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/22.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "DepartmentListViewController.h"
#import "NavigationBar.h"
#import "UIColor+Chat.h"
#import "MyDoctorCell.h"
#import "DepartmentListHelper.h"
#import "DepartmentMembersHelper.h"
#import "MyDoctorModel.h"
#import "DepartmentMembersViewController.h"

@interface DepartmentListViewController ()

@end

@implementation DepartmentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.navigationItem setTitle:@"科室"];
     [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView registerClass:[MyDoctorAddCell class] forCellReuseIdentifier:@"MyDoctorAddCell"];
    
    DepartmentListHelper *depLisHelper = [[DepartmentListHelper alloc]init];
    self.departmentAry = depLisHelper.departmentAry;
    
    DepartmentMembersHelper *depMemHelper = [[DepartmentMembersHelper alloc]init];
    self.doctorAry = depMemHelper.dataAry;
    
    // Do any additional setup after loading the view.
}

/**
 *  UITabelViewDataSource
 *
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _departmentAry.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HealthServiceModel *heaSerModel = [_departmentAry objectAtIndex:indexPath.row];
    MyDoctorAddCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyDoctorAddCell"];
    [cell setHeaSerModel:heaSerModel];
    [cell setTopLineStyle:CellLineStyleNone];
    [cell setBottonLineStyle:CellLineStyleDefault];
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

/**
 *  UITabelViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 22.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthServiceModel *heaSerModel = [_departmentAry objectAtIndex:indexPath.row];
    DepartmentMembersViewController *depMemVC = [[DepartmentMembersViewController alloc]init];
    [depMemVC.navigationItem setTitle:heaSerModel.title];
    depMemVC.dataAry = [self.doctorAry objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:depMemVC animated:YES];
}

-(void)backEvent:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
