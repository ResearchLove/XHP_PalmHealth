//
//  DepartmentMembersViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/22.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "DepartmentMembersViewController.h"
#import "MyDoctorCell.h"
#import "UIColor+Chat.h"
#import "NavigationBar.h"
#import "DoctorDetailsViewController.h"
#import "WHC_ModelSqlite.h"
#import <MBProgressHUD.h>

@interface DepartmentMembersViewController ()

@end

@implementation DepartmentMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView registerClass:[MyDoctorMembersCell class] forCellReuseIdentifier:@"MyDoctorMembersCell"];
    
    
     NSMutableArray *membersAry = [NSMutableArray arrayWithArray:[WHC_ModelSqlite query:[MyDoctorModel class] where:nil]];
    for (NSInteger i = 0; i < _dataAry.count; i++) {
        MyDoctorModel *myDoctorModel = [_dataAry objectAtIndex:i];
        for (NSInteger j = 0; j < membersAry.count; j++) {
            MyDoctorModel *myDoctorDbModel = [membersAry objectAtIndex:j];
            if (myDoctorDbModel.userId == myDoctorModel.userId) {
                myDoctorModel.isFollow = 1;
            }
        }
    }
    
    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDatasource
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
    MyDoctorModel *myDocModel = [self.dataAry objectAtIndex:indexPath.row];
    MyDoctorMembersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyDoctorMembersCell"];
    cell.myDocModel = myDocModel;
    cell.attentionBtn.tag = indexPath.row;
    [cell.attentionBtn addTarget:self action:@selector(attentionEvent:) forControlEvents:UIControlEventTouchUpInside];
    [cell setTopLineStyle:CellLineStyleNone];
    [cell setBottonLineStyle:CellLineStyleDefault];
   
    return cell;
}

/**
 *  UITableViewDelegte
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0f;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyDoctorModel *myDocModel = [self.dataAry objectAtIndex:indexPath.row];
    DoctorDetailsViewController *docDetVC = [[DoctorDetailsViewController alloc]init];
    docDetVC.myDoctorModel = myDocModel;
    [self.navigationController pushViewController:docDetVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}

/**
 *  关注/取消关注
 *
 */
-(void)attentionEvent:(UIButton *)sender
{
    MyDoctorModel *myDocModel = [self.dataAry objectAtIndex:sender.tag];
    if(myDocModel.isFollow == 0){
        myDocModel.isFollow = 1;
        if ([WHC_ModelSqlite insert:myDocModel]) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.removeFromSuperViewOnHide=YES;
            hud.alpha=0.8;
            hud.labelText = @"关注成功";
            [hud hide:YES afterDelay:1.5];
            NSLog(@"存储对象成功");
        }
    }else{
         myDocModel.isFollow = 0;
        if (![WHC_ModelSqlite delete:[MyDoctorModel class] where:[NSString stringWithFormat:@"userId = %ld",(long)myDocModel.userId]]) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.removeFromSuperViewOnHide=YES;
            hud.alpha=0.8;
            hud.labelText = @"取消关注成功";
            [hud hide:YES afterDelay:1.5];
            NSLog(@"删除对象成功");
        }
    }
    [self.tableView reloadData];
    
    NSString * path = [WHC_ModelSqlite localPathWithModel:[MyDoctorModel class]];
    NSLog(@"localPath = %@",path);
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
