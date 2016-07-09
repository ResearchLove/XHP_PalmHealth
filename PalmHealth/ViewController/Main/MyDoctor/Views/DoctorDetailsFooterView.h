//
//  DoctorDetailsFooterView.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDoctorModel.h"

@interface DoctorDetailsFooterView : UITableViewHeaderFooterView

@property (strong,nonatomic)UIButton *button;
@property (strong,nonatomic)MyDoctorModel *myDoctorModel;

@end
