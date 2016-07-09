//
//  HealthKnowledgeDetailsViewController+Data.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeDetailsViewController+Data.h"

@implementation HealthKnowledgeDetailsViewController (Data)

-(void)loadData
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.alpha=0.8;
    hud.labelText = @"加载中...";
   __weak typeof (self)weakSelf = self;
    
    [self.heaKnoDatViewModel requestHealthKnowledgeDetailsById:[self.heaKnoLisModel.ids integerValue] success:^(id data) {
        [hud setHidden:YES];
        weakSelf.heaKnoDetModel = data;
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
