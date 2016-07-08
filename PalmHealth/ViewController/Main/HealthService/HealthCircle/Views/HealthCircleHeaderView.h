//
//  FriendsCircleHeaderView.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/21.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsModel.h"

@interface HealthCircleHeaderView : UITableViewHeaderFooterView

@property (nonatomic,strong) UIImageView *backGroundImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *personView;
@property (nonatomic,strong) UIImageView *iconImageView;

@property (nonatomic,strong) PersonModel *personModel;

@end
