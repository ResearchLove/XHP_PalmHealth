//
//  HealthKnowledgeViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/24.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthKnowledgeDataViewModel.h"
#import <MBProgressHUD.h>

@interface HealthKnowledgeViewController : CommonTableViewController

@property (strong,nonatomic)NSMutableArray *dataAry;

@property (strong,nonatomic) HealthKnowledgeDataViewModel *heaKnoDatViewModel;

@end
