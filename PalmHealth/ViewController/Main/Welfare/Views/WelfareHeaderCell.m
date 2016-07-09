//
//  WelfareHeaderCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/27.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "WelfareHeaderCell.h"
#import "UIView+Frame.h"

@implementation WelfareHeaderCell

-(id)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

-(void)layoutSubviews
{

    [super layoutSubviews];
    
    CGFloat imageViewX = 0;
    CGFloat imageViewY = 0;
    CGFloat imageViewWidth = self.frameWidth;
    CGFloat imageViewHeight = self.frameHeight;
    [_imageView setFrame:CGRectMake(imageViewX, imageViewY, imageViewWidth, imageViewHeight)];

}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        [_imageView setImage:[UIImage imageNamed:@"wefareHeader"]];
    }
    return _imageView;
    
}

@end
