//
//  MyDoctorCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/21.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "MyDoctorCell.h"
#import "UIColor+Chat.h"

@implementation MyDoctorAddCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.userImageView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    float spaceX = 15.0f;
    float spaceY = self.frameHeight * 0.17;
    float imageWidth = self.frameHeight - spaceY * 2;
    [_userImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    float labelX = imageWidth + spaceX * 2;
    float labelWidth = self.frameWidth - labelX - spaceX * 0.15;
    [_titleLabel setFrame:CGRectMake(labelX, spaceY, labelWidth, imageWidth)];


}

-(UIImageView *)userImageView
{
    if (_userImageView == nil) {
        _userImageView = [[UIImageView alloc]init];
    }
    return _userImageView;
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
    [_userImageView setImage:[UIImage imageNamed:heaSerModel.iconPath]];
    [_titleLabel setText:heaSerModel.title];
}

@end


@implementation MyDoctorMembersCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.userImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
        [self.contentView addSubview:self.attentionBtn];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    float spaceX = 15.0f;
    float spaceY = self.frameHeight * 0.17;
    float imageWidth = self.frameHeight - spaceY * 2;
    [_userImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    float labelX = imageWidth + spaceX * 2;
    spaceY += imageWidth * 0.1;
    float labelWidth = self.frameWidth - labelX - spaceX * 5;
    float labelHeight = imageWidth * 0.4;
    [_titleLabel setFrame:CGRectMake(labelX, spaceY, labelWidth, labelHeight)];
    
    spaceY += labelHeight + imageWidth * 0.1;
    [_subTitleLabel setFrame:CGRectMake(labelX, spaceY, labelWidth, labelHeight)];
    
    float buttonWidth = 60.0f;
    float buttonHeight = 26.0f;
    float buttonX = self.frameWidth - spaceX - buttonWidth;
    float buttonY = self.frameHeight * 0.5 - buttonHeight * 0.5;
    [_attentionBtn setFrame:CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
}

-(UIImageView *)userImageView
{
    if (_userImageView == nil) {
        _userImageView = [[UIImageView alloc]init];
    }
    return _userImageView;
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
        _subTitleLabel.font = [UIFont systemFontOfSize:15.0f];
        _subTitleLabel.textColor = [UIColor grayColor];
    }
    return _subTitleLabel;
}
-(UIButton *)attentionBtn
{
    if (_attentionBtn == nil) {
        _attentionBtn = [[UIButton alloc] init];
        [_attentionBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_attentionBtn setTitleColor:[UIColor colorGreenDefault] forState:UIControlStateNormal];
        [_attentionBtn.layer setMasksToBounds:YES];
        [_attentionBtn.layer setCornerRadius:3.0f];
        [_attentionBtn.layer setBorderWidth:1.0f];
        [_attentionBtn.layer setBorderColor:[UIColor colorGreenDefault].CGColor];
    }
    return _attentionBtn;
}

-(void)setMyDocModel:(MyDoctorModel *)myDocModel
{
    [_userImageView setImage:[UIImage imageNamed:myDocModel.avatarURL]];
    [_titleLabel setText:myDocModel.userName];
    [_subTitleLabel setText:myDocModel.doctorLevel];
    if (myDocModel.isFollow == 0) {
        [_attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    }else{
        [_attentionBtn setTitle:@"取消关注" forState:UIControlStateNormal];
    }

}



@end