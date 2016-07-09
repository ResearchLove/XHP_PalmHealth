//
//  HealthBooksDetailsViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"
#import "HealthBooksDataViewModel.h"
#import <MBProgressHUD.h>
#import "HealthBooksDetailsModel.h"
#import "HealthBooksListModel.h"

@interface HealthBooksDetailsViewController : CommonTableViewController

@property (strong,nonatomic) HealthBooksDataViewModel *heaBooDatViewModel;
@property (strong,nonatomic) HealthBooksListModel *heaBooLisModel;
@property (strong,nonatomic) HealthBooksDetailsModel *heaBooDeaModel;

@end
