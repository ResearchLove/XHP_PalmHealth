//
//  HealthAnswerDetailsViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthAnswerDataViewModel.h"
#import "HealthKnowledgeDetailsModel.h"
#import "HealthAnswerListModel.h"
#import <MBProgressHUD.h>



@interface HealthAnswerDetailsViewController : CommonTableViewController

@property (strong,nonatomic) NSMutableArray *dataAry;

@property (strong,nonatomic) HealthAnswerDataViewModel *heaAnsDatViewModel;
@property (strong,nonatomic) HealthKnowledgeDetailsModel *heaKnoDetModel;
@property (strong,nonatomic) HealthAnswerListModel *heaAnsLisModel;

@end
