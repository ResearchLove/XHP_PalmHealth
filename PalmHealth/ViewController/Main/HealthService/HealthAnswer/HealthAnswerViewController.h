//
//  HealthAnswerViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/24.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthAnswerDataViewModel.h"
#import <MBProgressHUD.h>

@interface HealthAnswerViewController : CommonTableViewController

@property (strong,nonatomic)NSMutableArray *dataAry;

@property (strong,nonatomic) HealthAnswerDataViewModel *heaAnsDatViewModel;

@end
