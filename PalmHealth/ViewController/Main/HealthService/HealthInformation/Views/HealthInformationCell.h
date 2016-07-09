//
//  HealthInformationCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/21.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "HealthInformationModel.h"

@interface HealthInformationCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *iconImageView;
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *subTitleLabel;

@property (strong,nonatomic) HealthInformationModel *heaInfModel;


@end
