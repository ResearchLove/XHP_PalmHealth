//
//  HealthKnowledgeDetailsViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthKnowledgeDataViewModel.h"
#import "HealthKnowledgeDetailsModel.h"
#import "HealthKnowledgeListModel.h"
#import <MBProgressHUD.h>

@interface HealthKnowledgeDetailsViewController : CommonTableViewController

@property (strong,nonatomic) HealthKnowledgeDataViewModel *heaKnoDatViewModel;

@property (strong,nonatomic) HealthKnowledgeListModel *heaKnoLisModel;
@property (strong,nonatomic) HealthKnowledgeDetailsModel *heaKnoDetModel;

@end
