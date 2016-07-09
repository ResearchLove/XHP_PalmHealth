//
//  PersonalInformationViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/8.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "NavigationBar.h"
#import "PersonalInfomationCell.h"
#import "PersonalInfomationHelper.h"
#import "PersonalInfomationModel.h"

@interface PersonalInformationViewController ()

@end

@implementation PersonalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"个人信息"];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[PersonalInfomationHeaderCell class] forCellReuseIdentifier:@"PersonalInfomationHeaderCell"];
    [self.tableView registerClass:[PersonalInfomationOtherCell class] forCellReuseIdentifier:@"PersonalInfomationOtherCell"];
    
    PersonalInfomationHelper *perInfHelper = [[PersonalInfomationHelper alloc]init];
    self.dataAry = perInfHelper.dataAry;

    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDataSource
 *
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataAry count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalInfomationModel *perInfModel = [_dataAry objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        PersonalInfomationHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalInfomationHeaderCell"];
        cell.perInfModel = perInfModel;
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottonLineStyle:CellLineStyleDefault];
        return cell;
    }
    PersonalInfomationOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalInfomationOtherCell"];
    cell.perInfModel = perInfModel;
    [cell setTopLineStyle:CellLineStyleNone];
    indexPath.row ==  [_dataAry count] -1 ? [cell setBottonLineStyle:CellLineStyleFill] : [cell setBottonLineStyle:CellLineStyleDefault
                                                                                        ];
    return cell;
}

/**
 *  UITableViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 90.0f;
    }
    return 45.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
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
