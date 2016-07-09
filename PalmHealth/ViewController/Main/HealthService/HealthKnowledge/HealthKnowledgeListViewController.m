//
//  HealthKnowledgeListViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeListViewController.h"
#import "HealthKnowledgeListViewController+Data.h"
#import "HealthKnowledgeListCell.h"
#import "NavigationBar.h"
#import "UIColor+Chat.h"
#import "HealthKnowledgeDetailsViewController.h"

@interface HealthKnowledgeListViewController ()

@end

@implementation HealthKnowledgeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:_heaKnoModel.name];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView registerClass:[HealthKnowledgeListCell class] forCellReuseIdentifier:@"HealthKnowledgeListCell"];
    [self loadDataWithLoadingView:YES];
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
    HealthKnowledgeListModel *heaKnoLisModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthKnowledgeListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthKnowledgeListCell"];
    cell.heaKnoLisModel = heaKnoLisModel;
    [cell setTopLineStyle:CellLineStyleNone];
    [cell setBottonLineStyle:CellLineStyleDefault];
    return cell;
}


/**
 * UITableViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthKnowledgeListModel *heaKnoLisModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthKnowledgeDetailsViewController *heaKnoDetVC = [[HealthKnowledgeDetailsViewController alloc]init];
    heaKnoDetVC.heaKnoLisModel = heaKnoLisModel;
    [self.navigationController pushViewController:heaKnoDetVC animated:YES];
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
