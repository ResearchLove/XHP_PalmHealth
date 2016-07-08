//
//  NavigationBar.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/13.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar

+ (UIButton *)setNavigationLeftButton:(UINavigationItem *)navigationItem withTarget:(id)target andSelector:(SEL)selector
{
    
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0,17,34)];
    [backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backBtn addTarget:target
                action:selector
      forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem  *leftBaItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    navigationItem.leftBarButtonItem = leftBaItem;
    return backBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
