//
//  HealthBooksListViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksListViewController.h"
#import "HealthBooksListViewController+Data.h"
#import "HealthBooksListCell.h"
#import "UIColor+Chat.h"
#import "HealthBooksDetailsViewController.h"
#import "NavigationBar.h"

@interface HealthBooksListViewController ()

@end

@implementation HealthBooksListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    [self.navigationItem setTitle:_heaBooModel.name];
    
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView registerClass:[HealthBooksListCell class] forCellReuseIdentifier:@"HealthBooksListCell"];
    
    [self loadDataWithLoadingView:YES];
    // Do any additional setup after loading the view.
}

/**
 * UITableViewDatasource
 *
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
    HealthBooksListModel *heaBooLisModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthBooksListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthBooksListCell"];
    cell.heaBooLisModel = heaBooLisModel;
    return cell;
}

/**
 *  UITableViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthBooksListModel *heaBooLisModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthBooksDetailsViewController *heaBooDeaVC = [[HealthBooksDetailsViewController alloc]init];
    heaBooDeaVC.heaBooLisModel = heaBooLisModel;
    [self.navigationController pushViewController:heaBooDeaVC animated:YES];
    
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
