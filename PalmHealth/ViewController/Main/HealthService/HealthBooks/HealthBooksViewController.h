//
//  HealthBooksViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/24.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthBooksDataViewModel.h"
#import <MBProgressHUD.h>

@interface HealthBooksViewController : CommonTableViewController

@property (strong,nonatomic)NSMutableArray *dataAry;

@property (strong,nonatomic) HealthBooksDataViewModel *heaBooDatViewModel;

@end
