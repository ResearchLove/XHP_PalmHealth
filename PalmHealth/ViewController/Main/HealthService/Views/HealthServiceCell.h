//
//  HealthServiceCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "HealthServiceModel.h"

@interface HealthServiceCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *iconImageView;
@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) HealthServiceModel *heaSerModel;

@end
