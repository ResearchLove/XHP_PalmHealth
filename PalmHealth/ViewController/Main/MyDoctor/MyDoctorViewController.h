//
//  MyDoctorViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewController.h"

@interface MyDoctorViewController : CommonTableViewController

@property (strong,nonatomic)NSMutableArray *funcionGroupAry;


@property (nonatomic,strong) NSMutableArray *dataAry;       //格式化的好友列表数据
@property (strong,nonatomic) NSMutableArray *sectionAry;

@end
