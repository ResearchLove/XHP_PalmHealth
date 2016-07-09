//
//  HealthBooksDetailsCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "HealthBooksDetailsModel.h"

@interface HealthBooksDetailsCell : CommonTableViewCell

@property (strong,nonatomic) UILabel *contentLabel;
@property (strong,nonatomic) HealthBooksDetailsModel *heaBooDetModel;

+(CGFloat)cellHeightForModel:(HealthBooksDetailsModel *)heaBooDetModel;

@end
