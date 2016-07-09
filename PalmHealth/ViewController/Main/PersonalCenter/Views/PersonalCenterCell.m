//
//  PersonalCenterCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/6.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PersonalCenterCell.h"

@implementation PersonalCenterHeaderCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
    CGFloat imageViewWidth = self.frameHeight * 0.7;
    CGFloat spaceY = self.frameHeight * 0.5 - imageViewWidth * 0.5;
    [_userImageView setFrame:CGRectMake(spaceX, spaceY, imageViewWidth, imageViewWidth)];
    
    CGFloat labelX  = imageViewWidth + spaceX * 2;
    CGFloat labelHeight = 30;
    spaceY = self.frameHeight * 0.5 - labelHeight * 0.5;
    CGFloat labelWidth = self.frameWidth - labelX - spaceX;
    CGSize size = [_userNameLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_userNameLabel setFrame:CGRectMake(labelX, spaceY, size.width, labelHeight)];

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

-(void)setPerCenModel:(PersonalCenterModel *)perCenModel
{
    [_userImageView setImage:[UIImage imageNamed:perCenModel.imageURL]];
    [_userNameLabel setText:perCenModel.title];
    
}

@end

@implementation PersonalCenterOtherCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleImageView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    CGFloat spaceX = 15.0f;
    CGFloat imageViewWidth = self.frameHeight * 0.4;
    CGFloat spaceY = self.frameHeight * 0.5 - imageViewWidth * 0.5;
    [_titleImageView setFrame:CGRectMake(spaceX, spaceY, imageViewWidth, imageViewWidth)];
    
    CGFloat labelX  = imageViewWidth + spaceX * 2;
    CGFloat labelHeight = 30;
    spaceY = self.frameHeight * 0.5 - labelHeight * 0.5;
    CGFloat labelWidth = self.frameWidth - labelX - spaceX;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_titleLabel setFrame:CGRectMake(labelX, spaceY, size.width, labelHeight)];
    
}

-(UIImageView *)titleImageView
{
    if (_titleImageView == nil) {
        _titleImageView = [[UIImageView alloc]init];
    }
    return _titleImageView;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    return _titleLabel;
}


-(void)setPerCenModel:(PersonalCenterModel *)perCenModel
{
    [_titleImageView setImage:[UIImage imageNamed:perCenModel.imageURL]];
    [_titleLabel setText:perCenModel.title];
    
}

@end