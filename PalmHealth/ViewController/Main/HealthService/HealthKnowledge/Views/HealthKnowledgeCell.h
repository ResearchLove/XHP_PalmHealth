//
//  HealthKnowledgeCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "HealthKnowledgeModel.h"

@interface HealthKnowledgeCell : CommonTableViewCell

@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) HealthKnowledgeModel *heaKnoModel;

@end
