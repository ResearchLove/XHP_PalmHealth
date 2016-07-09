//
//  WelfareItemCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/27.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WelfareModel.h"

@interface WelfareItemCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) WelfareModel *welfareModel;

@end
