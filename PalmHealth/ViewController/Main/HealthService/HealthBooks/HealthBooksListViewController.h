//
//  HealthBooksListViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthBooksDataViewModel.h"
#import "HealthBooksModel.h"
#import <MBProgressHUD.h>

@interface HealthBooksListViewController : CommonTableViewController

@property (strong,nonatomic)NSMutableArray *dataAry;

@property (strong,nonatomic) HealthBooksDataViewModel *heaBooDatViewModel;
@property (strong,nonatomic) HealthBooksModel *heaBooModel;

@end
