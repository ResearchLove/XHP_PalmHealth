//
//  HealthKnowledgeViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/24.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeViewController.h"
#import "NavigationBar.h"
#import "HealthKnowledgeViewController+Data.h"
#import "HealthKnowledgeCell.h"
#import "UIColor+Chat.h"
#import "HealthKnowledgeListViewController.h"

@interface HealthKnowledgeViewController ()

@end

@implementation HealthKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    [self.navigationItem setTitle:@"健康知识"];
    
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView registerClass:[HealthKnowledgeCell class] forCellReuseIdentifier:@"HealthKnowledgeCell"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self loadData];

    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDataSource
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataAry.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthKnowledgeModel *heaKnoModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthKnowledgeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthKnowledgeCell"];
    cell.heaKnoModel = heaKnoModel;
    [cell setTopLineStyle:CellLineStyleNone];
    [cell setBottonLineStyle:CellLineStyleDefault];
    return cell;
}

/**
 *  UITableViewDelegate
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthKnowledgeModel *heaKnoModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthKnowledgeListViewController *heaKnoLisVC = [[HealthKnowledgeListViewController alloc]init];
    heaKnoLisVC.heaKnoModel = heaKnoModel;
    [self.navigationController pushViewController:heaKnoLisVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

/**
 *  Getter and Setter
 */
-(HealthKnowledgeDataViewModel *)heaKnoDatViewModel
{
    if (_heaKnoDatViewModel == nil) {
        _heaKnoDatViewModel = [[HealthKnowledgeDataViewModel alloc]init];
    }
    return _heaKnoDatViewModel;
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
