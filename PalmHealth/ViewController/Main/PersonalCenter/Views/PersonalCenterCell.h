//
//  PersonalCenterCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/6.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "PersonalCenterModel.h"

@interface PersonalCenterHeaderCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *userImageView;
@property (strong,nonatomic) UILabel *userNameLabel;

@property (strong,nonatomic) PersonalCenterModel *perCenModel;



@end


@interface PersonalCenterOtherCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *titleImageView;
@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) PersonalCenterModel *perCenModel;


@end
