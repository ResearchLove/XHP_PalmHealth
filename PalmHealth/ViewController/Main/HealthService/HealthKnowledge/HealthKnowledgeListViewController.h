//
//  HealthKnowledgeListViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthKnowledgeDataViewModel.h"
#import "HealthKnowledgeModel.h"
#import <MBProgressHUD.h>

@interface HealthKnowledgeListViewController : CommonTableViewController

@property (strong,nonatomic)NSMutableArray *dataAry;

@property (strong,nonatomic) HealthKnowledgeDataViewModel *heaKnoDatViewModel;

@property (strong,nonatomic) HealthKnowledgeModel *heaKnoModel;

@end
