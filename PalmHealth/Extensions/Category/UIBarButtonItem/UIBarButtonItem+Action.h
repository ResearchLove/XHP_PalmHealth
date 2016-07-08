//
//  UIBarButtonItem+Action.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/25.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BarButtonActionBlock)();

@interface UIBarButtonItem (Action)

+ (id)fixItemSpace:(CGFloat)space;

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionBlick:(BarButtonActionBlock) actionBlock;

- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionBlick:(BarButtonActionBlock)actionBlock;

-(id)initWithBackTitle:(NSString *)title traget:(id)traget action:(SEL)action;

-(void)setActionBlock:(BarButtonActionBlock)actionBlock;

@end
