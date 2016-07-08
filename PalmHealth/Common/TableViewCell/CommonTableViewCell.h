//
//  CommonTableViewCell.h
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"
#import <View+MASAdditions.h>


typedef NS_ENUM(NSInteger,CellLineStyle){
    CellLineStyleDefault,  //默认
    CellLineStyleFill,     //填满
    CellLineStyleNone,     //
};

@interface CommonTableViewCell : UITableViewCell

@property (nonatomic,strong) UIView *topLine;
@property (nonatomic,strong) UIView *bottonLine;  //底部横线
@property (nonatomic, assign) float leftFreeSpace;

@property (nonatomic,assign) CellLineStyle bottonLineStyle;
@property (nonatomic,assign) CellLineStyle topLineStyle;

@end
