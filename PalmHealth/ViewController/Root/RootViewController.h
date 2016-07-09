//
//  RootViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WelfareViewController.h"
#import "MyDoctorViewController.h"
#import "HealthServiceViewController.h"
#import "PersonalCenterViewController.h"

@interface RootViewController : UITabBarController

@property (strong,nonatomic) WelfareViewController *welfareVC;
@property (strong,nonatomic) MyDoctorViewController *myDoctorVC;
@property (strong,nonatomic) HealthServiceViewController *healthServiceVC;
@property (strong,nonatomic) PersonalCenterViewController *personalCenterVC;

@end
