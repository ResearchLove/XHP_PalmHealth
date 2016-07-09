//
//  WelfareModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/27.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "WelfareModel.h"

@implementation WelfareModel

+(WelfareModel *)createItemIconPath:(NSString *)iconPath title:(NSString *)title detailsURL:(NSString *)detailsURL
{
    WelfareModel *welfareModel = [[WelfareModel alloc]init];
    welfareModel.iconPath = iconPath;
    welfareModel.title = title;
    welfareModel.detailsURL = detailsURL;
    return welfareModel;
}

@end
