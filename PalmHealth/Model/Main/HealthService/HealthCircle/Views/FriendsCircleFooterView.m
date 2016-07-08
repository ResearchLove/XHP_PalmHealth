//
//  FriendsCircleFooterView.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/21.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "FriendsCircleFooterView.h"
#import "UIView+WHC_AutoLayout.h"
#import "UIView+Frame.h"
@implementation FriendsCircleFooterView

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.activetyIndicatorView];
        [self addSubview:self.titleLabel];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_activetyIndicatorView whc_X:self.frameWidth * 0.35];
    [_activetyIndicatorView whc_Width:20];
    [_activetyIndicatorView whc_Height:20];
    [_activetyIndicatorView whc_Y:self.frameHeight * 0.5 - _activetyIndicatorView.frameWidth * 0.5];
    
    [_titleLabel whc_X:5 toView:_activetyIndicatorView];
    [_titleLabel whc_Height:15];
    [_titleLabel whc_Y:self.frameHeight * 0.5 - _titleLabel.frameHeight * 0.5];
    [_titleLabel whc_Width];

}


-(UIActivityIndicatorView *)activetyIndicatorView
{

    if (_activetyIndicatorView == nil) {
        _activetyIndicatorView = [[UIActivityIndicatorView alloc]init];
        [_activetyIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [_activetyIndicatorView startAnimating];
    }
    return _activetyIndicatorView;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

-(void)setTitleStr:(NSString *)titleStr
{
    [_titleLabel setText:titleStr];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
