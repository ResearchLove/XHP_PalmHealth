//
//  HealthKnowledgeDetailsCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "HealthKnowledgeDetailsModel.h"

@interface HealthKnowledgeDetailsCell : CommonTableViewCell

@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UIImageView *titleImageView;
@property (strong,nonatomic) UILabel *contentsLabel;
@property (strong,nonatomic) HealthKnowledgeDetailsModel *heaKnoDetModel;

+(CGFloat)cellHeightForModel:(HealthKnowledgeDetailsModel *)heaKnoDeaModel;

@end
