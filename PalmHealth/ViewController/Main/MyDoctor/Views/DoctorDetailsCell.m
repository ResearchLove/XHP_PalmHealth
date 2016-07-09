//
//  DoctorDetailsCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "DoctorDetailsCell.h"


@implementation DoctorDetailsOneCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.userImgeView];
        [self.contentView addSubview:self.userNmeLabel];
        [self.contentView addSubview:self.levelLabel];
        [self.contentView addSubview:self.hospitalLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    float spaceX = 15.0f;
    float imageWidth = self.frameHeight * 0.6;
    float spaceY= self.frameHeight * 0.5 - imageWidth * 0.5;
    [_userImgeView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    float labelX = imageWidth + spaceX * 2;
    float labelY = self.frameHeight * 0.1;
    float labelWidth = self.frameWidth - labelX - spaceX;
    float labelHeight = self.frameHeight * 0.2;
    [_userNmeLabel setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
    
    labelY += labelHeight + self.frameHeight * 0.1;
    [_levelLabel setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
    
    labelY += labelHeight + self.frameHeight * 0.1;
    [_hospitalLabel setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
    

}

-(UIImageView *)userImgeView
{
    if (_userImgeView == nil) {
        _userImgeView = [[UIImageView alloc]init];
    }
    return _userImgeView;
}

-(UILabel *)userNmeLabel
{
    if (_userNmeLabel == nil) {
        _userNmeLabel = [[UILabel alloc]init];
        _hospitalLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    return _userNmeLabel;
}

-(UILabel *)levelLabel
{
    if (_levelLabel == nil) {
        _levelLabel = [[UILabel alloc]init];
        _levelLabel.font = [UIFont systemFontOfSize:15.0f];
        _levelLabel.textColor = [UIColor grayColor];
    }
    return _levelLabel;
}

-(UILabel *)hospitalLabel
{
    if (_hospitalLabel == nil) {
        _hospitalLabel = [[UILabel alloc]init];
        _hospitalLabel.font = [UIFont systemFontOfSize:15.0f];
        _hospitalLabel.textColor = [UIColor grayColor];
    }
    return _hospitalLabel;
}

-(void)setMyDocModel:(MyDoctorModel *)myDocModel
{
    [_userImgeView setImage:[UIImage imageNamed:myDocModel.avatarURL]];
    [_userNmeLabel setText:myDocModel.userName];
    [_levelLabel setText:[NSString stringWithFormat:@"%@  %@",myDocModel.departmentName,myDocModel.doctorLevel]];
    [_hospitalLabel setText:myDocModel.hospitalName];

}


@end

@implementation DoctorDetailsTwoCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
    }
    return self;

}


-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0;
    [super layoutSubviews];
    
    CGFloat spaceX = 15.0f;
    CGFloat spaceY = spaceX;
    CGFloat lableWidth = self.frameWidth * 0.3;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > lableWidth ? lableWidth : size.width;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, size.width, size.height)];
    
    spaceY = size.height + spaceY * 2;
    lableWidth = self.frameWidth - spaceX * 2;
    size = [_subTitleLabel sizeThatFits:CGSizeMake(lableWidth, MAXFLOAT)];
    size.width = size.width > lableWidth ? lableWidth : size.width;
    [_subTitleLabel setFrame:CGRectMake(spaceX, spaceY, size.width, size.height)];

}

-(UILabel *)titleLabel
{
    
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    return _titleLabel;
}

-(UILabel *)subTitleLabel
{
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc]init];
        [_subTitleLabel setTextColor:[UIColor grayColor]];
        _subTitleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_subTitleLabel setNumberOfLines:0];
    }
    return _subTitleLabel;
}
-(void)setMyDocModel:(MyDoctorModel *)myDocModel
{
    [_titleLabel setText:@"简介"];
    [_subTitleLabel setText:myDocModel.userIntroduce];

}

+(CGFloat)cellHeightForModel:(MyDoctorModel *)myDoctorModel
{
    
    CGFloat detailHeight = [myDoctorModel.userIntroduce boundingRectWithSize:CGSizeMake(WIDTH_SCREEN - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:15.0f]} context:nil].size.height;
    CGFloat height = 60.0 + detailHeight;
    return height;

}


@end

@implementation DoctorDetailsThreeCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    CGFloat spaceX = 15.0f;
    CGFloat labelHeight = 20;
    CGFloat spaceY = self.frameHeight * 0.5 - labelHeight * 0.5;
    CGFloat labelWidth = self.frameWidth * 0.5;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, labelWidth, labelHeight)];

}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    }
    return _titleLabel;
}

-(void)setSectionNumber:(NSInteger)sectionNumber
{
    _sectionNumber = sectionNumber;

}

-(void)setMyDocModel:(MyDoctorModel *)myDocModel
{
    if (_sectionNumber == 2) {
        [_titleLabel setText:@"查看出诊信息"];
    }else if (_sectionNumber == 3){
        [_titleLabel setText:@"点击预约"];
    }
}


@end
