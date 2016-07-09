//
//  HealthBooksListCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksListCell.h"
#import <UIImageView+WebCache.h>
#import "UIColor+Chat.h"
#import "UIImage+Draw.h"

@implementation HealthBooksListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.authorLabel];
        [self.contentView addSubview:self.operationLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    CGFloat spaceX = 15.0f;
    CGFloat spaceY = self.frameHeight * 0.1;
    CGFloat imageHeight = self.frameHeight * 0.8;
    CGFloat imageWidth = imageHeight * 0.7;
    [_titleImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageHeight)];
    
    CGFloat labelX = imageWidth + spaceX * 2;
    spaceY += imageHeight * 0.1;
    CGFloat labelWidth = self.frameWidth - labelX - spaceX;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    CGFloat labelHeight = self.frameHeight * 0.2;
    [_titleLabel setFrame:CGRectMake(labelX, spaceY, size.width, labelHeight)];
    
    spaceY += labelHeight + imageHeight * 0.1;
    size = [_authorLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_authorLabel setFrame:CGRectMake(labelX, spaceY, size.width, labelHeight)];
    
    spaceY += labelHeight + imageHeight * 0.1;
    size = [_operationLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_operationLabel setFrame:CGRectMake(labelX, spaceY, size.width, labelHeight)];
    

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

-(UILabel *)authorLabel
{
    if(_authorLabel == nil){
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.font = [UIFont systemFontOfSize:15.0f];
        _authorLabel.textColor = [UIColor grayColor];
    }
    return _authorLabel;
}

-(UILabel *)operationLabel
{
    if(_operationLabel == nil){
        _operationLabel = [[UILabel alloc]init];
        _operationLabel.font = [UIFont systemFontOfSize:15.0];
        _operationLabel.textColor = [UIColor grayColor];
    }
    return _operationLabel;
}

-(void)setHeaBooLisModel:(HealthBooksListModel *)heaBooLisModel
{
     [_titleImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEALTHKNOWLEDGE_IMAGE_HOST_URL,heaBooLisModel.img]] placeholderImage:[UIImage imageWithColor:[UIColor colorGrayBG]]];
    [_titleLabel setText:heaBooLisModel.name];
    [_authorLabel setText:heaBooLisModel.author];
    [_operationLabel setText:[NSString stringWithFormat:@"%d评论 %d收藏",[heaBooLisModel.rcount intValue],[heaBooLisModel.fcount intValue]]];


}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
