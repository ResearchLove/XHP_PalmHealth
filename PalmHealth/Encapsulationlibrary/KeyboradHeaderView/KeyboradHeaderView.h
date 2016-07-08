//
//  KeyboradHeaderView.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/12.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboradHeaderView : UIView

+ (CGFloat)height;

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction;

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                          leftAction:(SEL)leftAction
                                         rightAction:(SEL)rightAction
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show;

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                        cancelAction:(SEL)cancelAction;

+ (UIView *)monitorKeyboradShowAddHeaderViewObserver:(UIViewController*)sf
                                        cancelAction:(SEL)cancelAction
                                      showHeaderView:(BOOL)show;

+ (UIView *)monitorKeyboradShowAddHeaderView:(UIView *)headerView observer:(UIViewController *)sf;

- (UIButton *)createButton:(CGRect)frame txt:(NSString*)txt fontSize:(CGFloat)fontSize action:(SEL)action;

- (void)removeObserver;

@end
