//
//  FriendsCircleHeaderView.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/21.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "FriendsCircleHeaderView.h"
#import "UIView+WHC_AutoLayout.h"

@implementation FriendsCircleHeaderView

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self){
        [self addSubview:self.backGroundImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.personView];
        [_personView addSubview:self.iconImageView];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    [_backGroundImageView whc_X:0];
    [_backGroundImageView whc_Y:0];
    [_backGroundImageView whc_RightSpace:0];
    [_backGroundImageView whc_Height:280];
    
    
    [_personView whc_TrailingSpace:20];
    [_personView whc_Y:235];
    [_personView whc_Width:60];
    [_personView whc_Height:60];
    
   
    [_iconImageView whc_X:2];
    [_iconImageView whc_Y:2];
    [_iconImageView whc_Width:56];
    [_iconImageView whc_Height:56];
    
    [_titleLabel whc_TrailingSpace:15 toView:_personView];
    [_titleLabel whc_Y:255];
    [_titleLabel whc_widthAuto];
    [_titleLabel whc_Height:21];

}

-(UIImageView *)backGroundImageView
{
    if (_backGroundImageView == nil) {
        _backGroundImageView = [[UIImageView alloc]init];
    }
    return _backGroundImageView;
}

-(UILabel *)titleLabel
{

    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

-(UIView *)personView
{
    if(_personView == nil){
        _personView = [[UIView alloc]init];
    }
    return _personView;

}

-(UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}

-(void)setPersonModel:(PersonModel *)personModel
{
    [_backGroundImageView setImage:[UIImage imageNamed:personModel.backImage]];
    [_titleLabel setText:personModel.personName];
    [_iconImageView setImage:[UIImage imageNamed:personModel.personIcon]];


}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
