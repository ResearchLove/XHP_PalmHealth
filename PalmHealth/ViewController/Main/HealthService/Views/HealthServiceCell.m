//
//  HealthServiceCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthServiceCell.h"

@implementation HealthServiceCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self p_addMasonry];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    

}

-(void)p_addMasonry
{
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(15.0f);
        make.centerY.mas_equalTo(self.contentView);
        make.width.and.height.mas_equalTo(25.0f);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(15.0f);
        make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(15.0f);
    }];
}

-(UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;

}

-(void)setHeaSerModel:(HealthServiceModel *)heaSerModel
{
    [_iconImageView setImage:[UIImage imageNamed:heaSerModel.iconPath]];
    [_titleLabel setText:heaSerModel.title];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
