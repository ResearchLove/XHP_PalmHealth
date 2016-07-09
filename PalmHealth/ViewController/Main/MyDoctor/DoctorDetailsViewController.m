//
//  DoctorDetailsViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "DoctorDetailsViewController.h"
#import "DoctorDetailsCell.h"
#import "DoctorDetailsWebViewController.h"
#import "NavigationBar.h"
#import "DoctorDetailsFooterView.h"
#import "WHC_ModelSqlite.h"
#import "MBProgressHUD.h"

@interface DoctorDetailsViewController ()

@end

@implementation DoctorDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    [self.navigationItem setTitle:_myDoctorModel.userName];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[DoctorDetailsOneCell class] forCellReuseIdentifier:@"DoctorDetailsOneCell"];
    [self.tableView registerClass:[DoctorDetailsTwoCell class] forCellReuseIdentifier:@"DoctorDetailsTwoCell"];
    [self.tableView registerClass:[DoctorDetailsThreeCell class] forCellReuseIdentifier:@"DoctorDetailsThreeCell"];
    
    [self.tableView registerClass:[DoctorDetailsFooterView class] forHeaderFooterViewReuseIdentifier:@"DoctorDetailsFooterView"];
    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDataSource
 *
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        DoctorDetailsOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DoctorDetailsOneCell"];
        cell.myDocModel = _myDoctorModel;
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottonLineStyle:CellLineStyleFill];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        DoctorDetailsTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DoctorDetailsTwoCell"];
        cell.myDocModel = _myDoctorModel;
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottonLineStyle:CellLineStyleFill];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    }else{
        DoctorDetailsThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DoctorDetailsThreeCell"];
        cell.sectionNumber = indexPath.section;
        cell.myDocModel = _myDoctorModel;
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottonLineStyle:CellLineStyleFill];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

/**
 *  UITableViewDelegte
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80.0f;
    }else if (indexPath.section == 1){
      return  [DoctorDetailsTwoCell cellHeightForModel:_myDoctorModel];
    }else{
        return 45.0f;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section > 2) {
        return 75.0f;
    }
    return 15.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    if (section > 2) {
        DoctorDetailsFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DoctorDetailsFooterView"];
        view.myDoctorModel = _myDoctorModel;
        [view.button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        return view;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorDetailsWebViewController *docDetWebVC = [[DoctorDetailsWebViewController alloc]init];
    if (indexPath.section == 2) {
        docDetWebVC.loadWebURL = _myDoctorModel.visitInformationURL;
        [self.navigationController pushViewController:docDetWebVC animated:YES];
    }else if(indexPath.section == 3){
        docDetWebVC.loadWebURL = _myDoctorModel.appointmentURL;
        [self.navigationController pushViewController:docDetWebVC animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/**
 * 关注/会话点击事件
 *
 */
-(void)buttonEvent:(UIButton *)sender
{
    if(_myDoctorModel.isFollow == 0){
        _myDoctorModel.isFollow = 1;
        if ([WHC_ModelSqlite insert:_myDoctorModel]) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.removeFromSuperViewOnHide=YES;
            hud.alpha=0.8;
            hud.labelText = @"关注成功";
            [hud hide:YES afterDelay:1.5];
            NSLog(@"存储对象成功");
            [self.tableView reloadData];
        }
    }else{
        NSLog(@"jump chat page!");
    }

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
