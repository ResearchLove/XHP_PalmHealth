//
//  HealthAnswerListViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthAnswerDataViewModel.h"
#import "HealthKnowledgeModel.h"
#import <MBProgressHUD.h>

@interface HealthAnswerListViewController : CommonTableViewController

@property (strong,nonatomic)NSMutableArray *dataAry;

@property (strong,nonatomic) HealthAnswerDataViewModel*heaAnsDatViewModel;
@property (strong,nonatomic) HealthKnowledgeModel*heaKnoModel;

@end
