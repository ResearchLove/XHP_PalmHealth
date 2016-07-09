//
//  HealthBooksViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/24.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksViewController.h"
#import "HealthKnowledgeCell.h"
#import "HealthBooksModel.h"
#import "NavigationBar.h"
#import "UIColor+Chat.h"
#import "HealthBooksViewController+Data.h"
#import "HealthBooksListViewController.h"

@interface HealthBooksViewController ()

@end

@implementation HealthBooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    [self.navigationItem setTitle:@"健康图书"];
    
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
    HealthBooksModel *heaBooModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthKnowledgeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthKnowledgeCell"];
    cell.titleLabel.text = heaBooModel.name;
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
    
    HealthBooksModel *heaBooModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthBooksListViewController *heaBooLisVC = [[HealthBooksListViewController alloc]init];
    heaBooLisVC.heaBooModel = heaBooModel;
    [self.navigationController pushViewController:heaBooLisVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


/**
 *  Getter and Setter
 *
 */
-(HealthBooksDataViewModel *)heaBooDatViewModel
{
    if (_heaBooDatViewModel == nil) {
        _heaBooDatViewModel = [[HealthBooksDataViewModel alloc]init];
    }
    return _heaBooDatViewModel;
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
