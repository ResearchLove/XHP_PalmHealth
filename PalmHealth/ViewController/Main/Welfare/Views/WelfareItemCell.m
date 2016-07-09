//
//  WelfareItemCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/27.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "WelfareItemCell.h"
#import "UIView+Frame.h"

@implementation WelfareItemCell

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}


-(void)layoutSubviews
{
    
    CGFloat imageWidth = self.frameWidth * 0.35;
    CGFloat spaceX = self.frameWidth * 0.5 - imageWidth * 0.5;
    CGFloat spaceY = self.frameHeight * 0.2;
    [_imageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    spaceY = imageWidth + spaceY * 1.5;
    CGFloat lableWidth = self.frameWidth * 0.8;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > lableWidth ? lableWidth : size.width;
    CGFloat labelX = self.frameWidth * 0.5 - size.width * 0.5;
    CGFloat labelHeight = self.frameHeight * 0.2;
    [_titleLabel setFrame:CGRectMake(labelX, spaceY, size.width, labelHeight)];
    
     [super layoutSubviews];
    
   
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

-(void)setWelfareModel:(WelfareModel *)welfareModel
{
    [_imageView setImage:[UIImage imageNamed:welfareModel.iconPath]];
    [_titleLabel setText:welfareModel.title];
}



@end
