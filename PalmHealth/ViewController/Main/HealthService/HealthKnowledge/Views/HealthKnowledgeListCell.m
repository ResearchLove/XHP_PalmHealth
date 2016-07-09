//
//  HealthKnowledgeListCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeListCell.h"
#import <UIImageView+WebCache.h>
#import "UIColor+Chat.h"
#import "UIImage+Color.h"

@implementation HealthKnowledgeListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.categoryLabel];
        [self.contentView addSubview:self.operationLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    CGFloat spaceX = 15.0f;
    CGFloat imageWidth = self.frameHeight * 0.7;
    CGFloat spaceY = self.frameHeight * 0.5 - imageWidth * 0.5;
    [_iconImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    CGFloat labelX = imageWidth + spaceX * 2;
    CGFloat labelY = spaceY;
    CGFloat labelWidth = self.frameWidth - labelX - spaceX;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(labelWidth, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_titleLabel setFrame:CGRectMake(labelX, labelY, size.width, size.height)];
    
    labelY += imageWidth * 0.8;
    size = [_categoryLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    [_categoryLabel setFrame:CGRectMake(labelX, labelY, size.width, size.height)];
    
    labelWidth = self.frameWidth - labelX - size.width - spaceX;
    labelX = self.frameWidth - labelWidth - spaceX;
    [_operationLabel setFrame:CGRectMake(labelX, labelY, labelWidth, size.height)];

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
        _titleLabel.font = [UIFont systemFontOfSize:16.0f];
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

-(UILabel *)categoryLabel
{
    if (_categoryLabel == nil) {
        _categoryLabel = [[UILabel alloc]init];
        _categoryLabel.font = [UIFont systemFontOfSize:14.0f];
        _categoryLabel.textColor = [UIColor grayColor];
    }
    return _categoryLabel;
}

-(UILabel *)operationLabel
{
    if (_operationLabel == nil) {
        _operationLabel = [[UILabel alloc]init];
        _operationLabel.font = [UIFont systemFontOfSize:14.0f];
        _operationLabel.textColor = [UIColor grayColor];
        _operationLabel.textAlignment = NSTextAlignmentRight;
    }
    return _operationLabel;
}

-(void)setHeaKnoLisModel:(HealthKnowledgeListModel *)heaKnoLisModel
{
     [_iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEALTHKNOWLEDGE_IMAGE_HOST_URL,heaKnoLisModel.img]] placeholderImage:[UIImage imageWithColor:[UIColor colorGrayBG]]];
    
    [_titleLabel setText:heaKnoLisModel.title];
    [_categoryLabel setText:@"生活"];
    [_operationLabel setText:[NSString stringWithFormat:@"%d收藏  %d评论",[heaKnoLisModel.fcount intValue],[heaKnoLisModel.rcount intValue]]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
