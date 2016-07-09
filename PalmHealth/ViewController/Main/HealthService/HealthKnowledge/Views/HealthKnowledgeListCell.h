//
//  HealthKnowledgeListCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "HealthKnowledgeListModel.h"

@interface HealthKnowledgeListCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *iconImageView;
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *categoryLabel;
@property (strong,nonatomic) UILabel *operationLabel;

@property (strong,nonatomic) HealthKnowledgeListModel *heaKnoLisModel;

@end
