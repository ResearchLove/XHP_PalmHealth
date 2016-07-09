//
//  HealthServiceViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthServiceViewController.h"
#import "HealthServiceModel.h"
#import "HealthServiceCell.h"
#import "HealthServiceHelper.h"
#import "UIColor+Chat.h"
#import "HealthCircleVC.h"
#import "HealthInformationViewController.h"
#import "BuyMedicineViewController.h"
#import "HealthAnswerViewController.h"
#import "HealthBooksViewController.h"
#import "HealthKnowledgeViewController.h"

@interface HealthServiceViewController ()

@property(nonatomic,strong) HealthCircleVC *heaCirVC;
@property(nonatomic,strong) HealthInformationViewController *heaInfVC;
@property(nonatomic,strong) BuyMedicineViewController *buyMedVC;

@end

@implementation HealthServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"健康服务"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView registerClass:[HealthServiceCell class] forCellReuseIdentifier:@"HealthServiceCell"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    HealthServiceHelper *heaSerHelper = [[HealthServiceHelper alloc]init];
    self.dataAry = heaSerHelper.healthServiceMenuData;
    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDataSource
 *
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataAry.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataAry[section] count];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthServiceModel *heaSerModel = [self.dataAry[indexPath.section] objectAtIndex:indexPath.row];
    HealthServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthServiceCell"];
    [cell setHeaSerModel:heaSerModel];
    
    if (indexPath.section == 0 || indexPath.section == 2) {
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottonLineStyle:CellLineStyleFill];
    }else{
        indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == [_dataAry[indexPath.section] count] - 1 ? [cell setBottonLineStyle:CellLineStyleFill] : [cell setBottonLineStyle:CellLineStyleDefault];
    
    }
    return cell;
}

/**
 *  UITableViewDelegate
 *
 */
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthServiceModel *heaSerModel = [self.dataAry[indexPath.section] objectAtIndex:indexPath.row];
    if ([heaSerModel.title isEqualToString:@"健康圈"]) {
        HealthCircleVC*heaCirVC = [[HealthCircleVC alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:heaCirVC animated:YES];
    }
    if ([heaSerModel.title isEqualToString:@"健康资讯"]) {
        HealthInformationViewController *heaInfVC = [[HealthInformationViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:heaInfVC animated:YES];
    }
    
    if ([heaSerModel.title isEqualToString:@"健康知识"]) {
        HealthKnowledgeViewController *heaKnowVC = [[HealthKnowledgeViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:heaKnowVC animated:YES];
    }
    
    if ([heaSerModel.title isEqualToString:@"健康问答"]) {
        HealthAnswerViewController *heaAnsVC = [[HealthAnswerViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:heaAnsVC animated:YES];
    }
    
    if ([heaSerModel.title isEqualToString:@"健康图书"]) {
        HealthBooksViewController *heaBooVC = [[HealthBooksViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:heaBooVC animated:YES];
    }
    
    
    
    if ([heaSerModel.title isEqualToString:@"快速购药"]) {
        BuyMedicineViewController *buyMedVC = [[BuyMedicineViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:buyMedVC animated:YES];
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
