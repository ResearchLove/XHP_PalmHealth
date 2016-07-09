//
//  HealthBooksListCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "HealthBooksListModel.h"

@interface HealthBooksListCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *titleImageView;
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *authorLabel;
@property (strong,nonatomic) UILabel *operationLabel;

@property (strong,nonatomic) HealthBooksListModel *heaBooLisModel;

@end
