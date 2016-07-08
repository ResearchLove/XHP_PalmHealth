//
//  UIView+Extensions.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/31.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "UIView+Extensions.h"

@implementation UIView (Extensions)

- (void)removeAllSubViews
{
    for (id view in self.subviews) {
        [view removeFromSuperview];
    }
}

@end
