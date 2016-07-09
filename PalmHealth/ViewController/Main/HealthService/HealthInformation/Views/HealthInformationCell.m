//
//  HealthInformationCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/21.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthInformationCell.h"

@implementation HealthInformationCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    CGFloat spaceX = 15.0f;
    CGFloat imageWidth = self.frameHeight * 0.8;
    CGFloat spaceY = self.frameHeight * 0.5 - imageWidth * 0.5;
    [_iconImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    spaceX = imageWidth + spaceX * 2;
    spaceY =  spaceY * 1.5;
    float labelWidth = self.frameWidth - spaceX - 10;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, size.width, size.height)];
    
    spaceY = size.height + spaceY * 1.5;
    size = [_subTitleLabel sizeThatFits:CGSizeMake(labelWidth, MAXFLOAT)];
    size.width = size.width > labelWidth ? size.width : labelWidth;
    [_subTitleLabel setFrame:CGRectMake(spaceX, spaceY, size.width, size.height)];
    
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
        _titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel
{
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.numberOfLines = 3;
        _subTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _subTitleLabel.font = [UIFont systemFontOfSize:13.0f];
        _subTitleLabel.textColor = [UIColor grayColor];
        
    }
    return _subTitleLabel;
}

-(void)setHeaInfModel:(HealthInformationModel *)heaInfModel
{
    [_iconImageView setImage:[UIImage imageNamed:heaInfModel.imageURL]];
    [_titleLabel setText:heaInfModel.title];
    [_subTitleLabel setText:heaInfModel.subTitle];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
