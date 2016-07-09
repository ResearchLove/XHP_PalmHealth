//
//  DoctorDetailsFooterView.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "DoctorDetailsFooterView.h"
#import "UIColor+Chat.h"
#import "UIImage+Color.h"
#import "UIView+Frame.h"

@implementation DoctorDetailsFooterView

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.button];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat spaceX = 15.0f;
    CGFloat buttonHeight = 45.0f;
    CGFloat buttonWidth = self.frameWidth - spaceX * 2;
    CGFloat spaceY = self.frameHeight * 0.5 - buttonHeight * 0.5;
    [_button setFrame:CGRectMake(spaceX, spaceY, buttonWidth, buttonHeight)];


}

-(UIButton *)button
{
    if (_button == nil) {
        _button = [[UIButton alloc]init];
        [_button.layer setMasksToBounds:YES];
        [_button.layer setCornerRadius:4.0f];
        [_button.layer setBorderWidth:BORDER_WIDTH_1PX];
        [_button.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_button setBackgroundColor:[UIColor colorGreenDefault]];
        [_button setBackgroundImage:[UIImage imageWithColor:[UIColor colorGreenDefault]] forState:UIControlStateHighlighted];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button.layer setBorderColor:[UIColor colorGrayLine].CGColor];
    }
    return _button;
}

-(void)setMyDoctorModel:(MyDoctorModel *)myDoctorModel
{
    _myDoctorModel = myDoctorModel;
    if (myDoctorModel.isFollow == 0) {
        [_button setTitle:@"关注" forState:UIControlStateNormal];
    }else{
         [_button setTitle:@"会话" forState:UIControlStateNormal];
    }
    
}

@end
