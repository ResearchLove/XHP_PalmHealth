//
//  HealthAnswerListViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthAnswerListViewController.h"
#import "NavigationBar.h"
#import "UIColor+Chat.h"
#import "HealthKnowledgeListCell.h"
#import "HealthAnswerListViewController+Data.h"
#import "HealthAnswerListModel.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Draw.h"
#import "HealthAnswerDetailsViewController.h"

@interface HealthAnswerListViewController ()

@end

@implementation HealthAnswerListViewController

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
    HealthAnswerListModel *heaAnsLisModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthKnowledgeListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthKnowledgeListCell"];
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEALTHKNOWLEDGE_IMAGE_HOST_URL,heaAnsLisModel.img]] placeholderImage:[UIImage imageWithColor:[UIColor colorGrayBG]]];
    
    [cell.titleLabel setText:heaAnsLisModel.title];
    [cell.categoryLabel setText:@"生活"];
    [cell.operationLabel setText:[NSString stringWithFormat:@"%d收藏  %d评论",[heaAnsLisModel.fcount intValue],[heaAnsLisModel.rcount intValue]]];
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
    HealthAnswerListModel *heaAnsLisModel = [self.dataAry objectAtIndex:indexPath.row];
    HealthAnswerDetailsViewController *heaAnsDetVC = [[HealthAnswerDetailsViewController alloc]init];
    heaAnsDetVC.heaAnsLisModel = heaAnsLisModel;
    [self.navigationController pushViewController:heaAnsDetVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


/**
 *  Getter and Setter
 */
-(HealthAnswerDataViewModel *)heaAnsDatViewModel
{
    if (_heaAnsDatViewModel == nil) {
        _heaAnsDatViewModel = [[HealthAnswerDataViewModel alloc]init];
    }
    return _heaAnsDatViewModel;
    
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
