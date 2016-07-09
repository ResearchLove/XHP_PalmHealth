//
//  HealthBooksViewController+Data.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksViewController+Data.h"

@implementation HealthBooksViewController (Data)

-(void)loadData
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.alpha=0.8;
    hud.labelText = @"提交中...";
    __weak typeof (self)weakSelf = self;
    
    [self.heaBooDatViewModel requestHealthBooksClassifySuccess:^(id data) {
        [hud setHidden:YES];
        weakSelf.dataAry = data;
        [weakSelf.tableView reloadData];
    } failure:^(NSString *error) {
        [hud setHidden:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.removeFromSuperViewOnHide=YES;
        hud.alpha=0.8;
        hud.labelText = error;
        [hud hide:YES afterDelay:1.5];
    }];
}


@end
