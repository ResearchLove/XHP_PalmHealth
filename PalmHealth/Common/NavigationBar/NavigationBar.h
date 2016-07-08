//
//  NavigationBar.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/13.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBar : UINavigationBar

+ (UIButton *)setNavigationLeftButton:(UINavigationItem *)navigationItem withTarget:(id)target andSelector:(SEL)selector;

@end
