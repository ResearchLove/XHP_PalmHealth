//
//  HealthInformationViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/21.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthInformationViewController.h"
#import "HealthInformationHelper.h"
#import "HealthInformationCell.h"
#import "UIColor+Chat.h"
#import "HealthInformationModel.h"
#import "NavigationBar.h"
#import "HealthInformationDetailsViewController.h"

@interface HealthInformationViewController ()

@end

@implementation HealthInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    
    [self.navigationItem setTitle:@"健康资讯"];
    
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView registerClass:[HealthInformationCell class] forCellReuseIdentifier:@"HealthInformationCell"];
    
    HealthInformationHelper *heaInfHel = [[HealthInformationHelper alloc]init];
    self.dataAry = heaInfHel.dataAry;
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
    return [self.dataAry count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthInformationModel *heaInfModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthInformationCell"];
    [cell setHeaInfModel:heaInfModel];
    [cell setTopLineStyle:CellLineStyleNone];
    [cell setBottonLineStyle:CellLineStyleDefault];
    return cell;
}

/**
 *  UITableViewDelegate
 *
 */
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    HealthInformationModel *heaInfModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthInformationDetailsViewController *heaInfDetVC = [[HealthInformationDetailsViewController alloc]init];
    heaInfDetVC.heaInfModel = heaInfModel;
    [self.navigationController pushViewController:heaInfDetVC animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
