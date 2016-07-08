//
//  UIImage+Draw.m
//  SmallWeChat
//
//  Created by apple on 15/12/24.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "UIImage+Draw.h"

@implementation UIImage (Draw)

+(UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
