//
//  UIBarButtonItem+Action.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/25.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

char * const UIBarButtonItemActionBlock = "UIBarButtonItemActionBlock";
#import "UIBarButtonItem+Action.h"
#import "UIView+Frame.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (Action)

+ (id)fixItemSpace:(CGFloat)space
{
    UIBarButtonItem *fix = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fix.width = space;
    return fix;
    
}

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionBlick:(BarButtonActionBlock)actionBlock
{
    if (self = [self initWithTitle:title style:style target:nil action:nil]) {
        [self setActionBlock:actionBlock];
    }
    return self;
}

-(id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionBlick:(BarButtonActionBlock)actionBlock
{
    if (self = [self initWithImage:image style:style target:nil action:nil]) {
        [self setActionBlock:actionBlock];
    }
    return self;
}

-(id)initWithBackTitle:(NSString *)title traget:(id)traget action:(SEL)action
{
    UIButton *button = [[UIButton alloc]init];
    [button addTarget:traget action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav_back"]];
    [button addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]init];
    [label setText:title];
    [label setTextColor:[UIColor whiteColor]];
    [button addSubview:label];
    
    if (self = [self initWithCustomView:button]) {
        [imageView setFrame:CGRectMake(0, 0, 17, 34)];
        CGSize size = [label sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        [label setFrame:CGRectMake(17, 0, size.width, 34)];
        [button setFrame:CGRectMake(0, 0, label.right, 34)];
    }
    return self;
}

-(void)performActionBlock
{
    dispatch_block_t block = self.actionBlock;
    
    if (block)
        block();

}

- (BarButtonActionBlock)actionBlock {
    return objc_getAssociatedObject(self, UIBarButtonItemActionBlock);
}

-(void)setActionBlock:(BarButtonActionBlock)actionBlock
{
    if (actionBlock != self.actionBlock) {
        [self willChangeValueForKey:@"actionBlock"];
        
        objc_setAssociatedObject(self,
                                 UIBarButtonItemActionBlock,
                                 actionBlock,
                                 OBJC_ASSOCIATION_COPY);
        [self setTarget:self];
        [self setAction:@selector(performActionBlock)];
        [self didChangeValueForKey:@"actionBlock"];
    }
}

@end
