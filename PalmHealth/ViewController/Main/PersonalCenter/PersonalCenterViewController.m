//
//  PersonalCenterViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterCell.h"
#import "PersonalCenterHelper.h"
#import "PersonalCenterModel.h"
#import "PersonalInformationViewController.h"
#import "HealthRecordsViewController.h"
#import "MyCouponsViewController.h"
#import "MyOrderViewController.h"
#import "CollectionViewController.h"
#import "SettingViewController.h"

@interface PersonalCenterViewController ()

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"个人中心"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[PersonalCenterHeaderCell class] forCellReuseIdentifier:@"PersonalCenterHeaderCell"];
    [self.tableView registerClass:[PersonalCenterOtherCell class] forCellReuseIdentifier:@"PersonalCenterOtherCell"];
    
    PersonalCenterHelper *perCenHelper = [[PersonalCenterHelper alloc]init];
    self.dataAry = perCenHelper.dataAry;
    
    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDataSource
 *
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataAry.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataAry[section] count];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalCenterModel *perCenModel = [_dataAry[indexPath.section] objectAtIndex:indexPath.row];
    
    if (indexPath.section == 0) {
         PersonalCenterHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalCenterHeaderCell"];
        cell.perCenModel = perCenModel;
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottonLineStyle:CellLineStyleFill];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    PersonalCenterOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalCenterOtherCell"];
    cell.perCenModel = perCenModel;
    if (indexPath.row == [_dataAry[indexPath.section -1] count] - 1) {
        indexPath.section == _dataAry.count ? [cell setBottonLineStyle:CellLineStyleFill] :[cell setBottonLineStyle:CellLineStyleNone];
    }else{
        [cell setBottonLineStyle:CellLineStyleDefault];
    }
    return cell;
}

/**
 *  UITableViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0) {
        PersonalInformationViewController *perInfVC = [[PersonalInformationViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:perInfVC animated:YES];
    }else if([indexPath section] == 1){
        if ([indexPath row] == 0) {
            HealthRecordsViewController *heaRecVC = [[HealthRecordsViewController alloc]init];
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:heaRecVC animated:YES];
        }else if([indexPath row] == 1){
            MyCouponsViewController *myCouVC = [[MyCouponsViewController alloc]init];
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:myCouVC animated:YES];
        }else if ([indexPath row] == 2){
            MyOrderViewController *myOrdVC = [[MyOrderViewController alloc]init];
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:myOrdVC animated:YES];
        }else if([indexPath row] == 3){
            CollectionViewController *collectionVC = [[CollectionViewController alloc]init];
            [self setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:collectionVC animated:YES];
        }
    }else {
        SettingViewController *settingVC = [[SettingViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:settingVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];
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
