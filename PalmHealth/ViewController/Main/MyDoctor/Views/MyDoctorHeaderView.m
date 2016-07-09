//
//  MyDoctorHeaderView.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/24.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "MyDoctorHeaderView.h"
#import "UIView+Frame.h"

@interface MyDoctorHeaderView()

@property (nonatomic,strong) UILabel *titleLabel;


@end

@implementation MyDoctorHeaderView

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIView *bgView = [UIView new];
        [bgView setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
        [self setBackgroundView:bgView];
        [self addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel setFrame:CGRectMake(10, 0, self.frameWidth - 15, self.frameHeight)];
    
    
}
-(void)setTitle:(NSString *)title
{
    
    _title = title;
    [_titleLabel setText:title];
    
}
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:14.5f]];
        [_titleLabel setTextColor:[UIColor grayColor]];
    }
    return _titleLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
