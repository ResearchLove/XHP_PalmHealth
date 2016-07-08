//
//  KeyboradHeaderView.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/12.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "KeyboradHeaderView.h"
#import "UIView+WHC_AutoLayout.h"

#define ButtonWidth (60.0)         //按钮宽度
#define HeaderViewHeight (40.0)    //头部视图
#define Kpading          (10.0)    //间隙
#define FontSize         (30.0)    //字体大小

@interface KeyboradHeaderView (){
    UIViewController  *     _sf;
    SEL                     _leftAction;
    SEL                     _rightAction;
    SEL                     _cancelAction;
    UIView            *     _headerView;
}
@end

@implementation KeyboradHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:_sf];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:_sf];
    }
    return self;
}

+(CGFloat)height
{
    return HeaderViewHeight;

}

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                        cancelAction:(SEL)cancelAction{
    return [KeyboradHeaderView monitorKeyboradShowAddHeaderViewObserver:sf cancelAction:cancelAction showHeaderView:YES];
}

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show{
    return [KeyboradHeaderView monitorKeyboradShowAddHeaderViewObserver:sf leftAction:nil rightAction:nil cancelAction:cancelAction showHeaderView:show];
}


+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction{
    return [KeyboradHeaderView monitorKeyboradShowAddHeaderViewObserver:sf leftAction:leftAction rightAction:rightAction cancelAction:cancelAction showHeaderView:YES];
}


+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show {
    return [KeyboradHeaderView monitorKeyboradShowAddHeaderViewObserver:sf leftAction:leftAction rightAction:rightAction cancelAction:cancelAction showHeaderView:show headerVeiw:nil];
}



+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show
                                          headerVeiw:(UIView *)headerView {
    KeyboradHeaderView  * view = [[KeyboradHeaderView alloc]initWithFrame:CGRectMake(0.0,CGRectGetHeight([UIScreen mainScreen].bounds), CGRectGetWidth([UIScreen mainScreen].bounds), HeaderViewHeight)];
    view.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [view setSF:sf];
    [view setHeaderView:headerView];
    if (headerView == nil) {
        [view setLeftAction:leftAction];
        [view setRightAction:rightAction];
        [view setCancelAction:cancelAction];
        [sf.view addSubview:view];
        if(leftAction && rightAction){
            UIButton * leftBtn = [view createButton:CGRectMake(Kpading, 0.0, ButtonWidth, HeaderViewHeight) txt:@"←" fontSize:FontSize action:leftAction];
            [view createButton:CGRectMake(CGRectGetMaxX(leftBtn.frame) + Kpading * 2.0, 0.0, ButtonWidth, HeaderViewHeight) txt:@"→" fontSize:FontSize action:rightAction];
        }
        [view createButton:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - (Kpading + ButtonWidth), 0.0, ButtonWidth, HeaderViewHeight) txt:@"完成"fontSize:16.0  action:cancelAction];
    }else {
        if (show) {
            [sf.view addSubview:headerView];
        }
    }
    return view;
}


+ (UIView *)monitorKeyboradShowAddHeaderView:(UIView *)headerView observer:(UIViewController *)sf {
    return [KeyboradHeaderView monitorKeyboradShowAddHeaderViewObserver:sf leftAction:nil rightAction:nil cancelAction:nil showHeaderView:YES headerVeiw:headerView];
}

- (void)setSF:(UIViewController*)sf{
    _sf = sf;
}

- (void)setLeftAction:(SEL)leftAction{
    _leftAction = leftAction;
}

- (void)setRightAction:(SEL)rightAction{
    _rightAction = rightAction;
}

- (void)setCancelAction:(SEL)cancelAction{
    _cancelAction = cancelAction;
}

- (void)setHeaderView:(UIView *)headerView {
    _headerView = headerView;
}

-(UIButton *)createButton:(CGRect)frame txt:(NSString *)txt fontSize:(CGFloat)fontSize action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    [button setTitle:txt forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:_sf action:action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}

- (void)keyboardWillShow:(NSNotification*)notifiy
{

    UIView *headerView = _headerView != nil ? _headerView : self;
    if (![_sf.view.subviews containsObject:headerView]) {
        [_sf.view addSubview:headerView];
    }
    NSDictionary *info = [notifiy userInfo];
    CGRect keyboardFrame = CGRectZero;
    [[info objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    NSValue *animationDurValue = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurValue getValue:&animationDuration];
    [headerView whc_BaseLineSpace:kbSize.height];
    [headerView updateConstraintsIfNeeded];
    [headerView updateConstraints];
    [UIView animateWithDuration:animationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [headerView layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)keyboardWillHidden:(NSNotification *)notifiy{
    UIView * headerView = _headerView != nil ? _headerView : self;
    NSDictionary *info = [notifiy userInfo];
    NSValue * animationDurValue = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurValue getValue:&animationDuration];
    [headerView whc_BaseLineSpace:-CGRectGetHeight(headerView.frame)];
    [headerView updateConstraintsIfNeeded];
    [headerView updateConstraints];
    [UIView animateWithDuration:animationDuration animations:^{
        [headerView layoutIfNeeded];
    }completion:^(BOOL finished) {
    }];
}

- (void)removeObserver{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
