//
//  PersonalInfomationCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/8.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PersonalInfomationCell.h"

@implementation PersonalInfomationHeaderCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.userImageView];
        [self.contentView addSubview:self.userNameLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    CGFloat spaceX = 15.0f;
    CGFloat labelHeight = 30.0f;
    CGFloat spaceY = self.frameHeight * 0.5 - labelHeight * 0.5;
    CGFloat labelWidth = self.frameWidth * 0.4;
    CGSize size = [_userNameLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_userNameLabel setFrame:CGRectMake(spaceX, spaceY, size.width, labelHeight)];
    
    CGFloat imageViewWidth = self.frameHeight * 0.7;
    CGFloat imageX = self.frameWidth - imageViewWidth - spaceX;
    CGFloat imageY = self.frameHeight * 0.5 - imageViewWidth * 0.5;
    [_userImageView setFrame:CGRectMake(imageX, imageY, imageViewWidth, imageViewWidth)];
    
}

-(UIImageView *)userImageView
{
    if (_userImageView == nil) {
        _userImageView = [[UIImageView alloc]init];
        [_userImageView.layer setMasksToBounds:YES];
        [_userImageView.layer setCornerRadius:5.0f];
    }
    return _userImageView;
}

-(UILabel *)userNameLabel
{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        [_userNameLabel setFont:[UIFont systemFontOfSize:17.0f]];
    }
    return _userNameLabel;
}

-(void)setPerInfModel:(PersonalInfomationModel *)perInfModel
{
    [_userNameLabel setText:perInfModel.title];
    [_userImageView setImage:[UIImage imageNamed:perInfModel.contents]];

}


@end

@implementation PersonalInfomationOtherCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentsLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    CGFloat spaceX = 15.0f;
    CGFloat labelHeight = 30.0f;
    CGFloat spaceY = self.frameHeight * 0.5 - labelHeight * 0.5;
    CGFloat labelWidth = self.frameWidth * 0.4;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, size.width, labelHeight)];
    
    
    labelWidth = self.frameWidth - spaceX * 2 - size.width;
    size = [_contentsLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    spaceX = self.frameWidth - spaceX - size.width;
    [_contentsLabel setFrame:CGRectMake(spaceX, spaceY, size.width, labelHeight)];

}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    return _titleLabel;
}

-(UILabel *)contentsLabel
{
    if (_contentsLabel == nil) {
        _contentsLabel = [[UILabel alloc]init];
        _contentsLabel.font = [UIFont systemFontOfSize:16.0f];
        _contentsLabel.textColor = [UIColor grayColor];
    }
    return _contentsLabel;
}

-(void)setPerInfModel:(PersonalInfomationModel *)perInfModel
{
    [_titleLabel setText:perInfModel.title];
    [_contentsLabel setText:perInfModel.contents];
}

@end

