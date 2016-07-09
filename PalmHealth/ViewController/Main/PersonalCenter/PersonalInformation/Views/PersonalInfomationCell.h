//
//  PersonalInfomationCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/8.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "PersonalInfomationModel.h"

@interface PersonalInfomationHeaderCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *userImageView;
@property (strong,nonatomic) UILabel *userNameLabel;

@property (strong,nonatomic) PersonalInfomationModel *perInfModel;

@end

@interface PersonalInfomationOtherCell : CommonTableViewCell

@property (copy,nonatomic) UILabel *titleLabel;
@property (copy,nonatomic) UILabel *contentsLabel;

@property (strong,nonatomic) PersonalInfomationModel *perInfModel;

@end
