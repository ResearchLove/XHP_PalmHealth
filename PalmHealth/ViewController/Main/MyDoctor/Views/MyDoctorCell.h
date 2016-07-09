//
//  MyDoctorCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/21.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "HealthServiceModel.h"
#import "MyDoctorModel.h"

@interface MyDoctorAddCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *userImageView;
@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) HealthServiceModel *heaSerModel;

@end


@interface MyDoctorMembersCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *userImageView;
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *subTitleLabel;
@property (strong,nonatomic) UIButton *attentionBtn;

@property (strong,nonatomic) MyDoctorModel *myDocModel;

@end
