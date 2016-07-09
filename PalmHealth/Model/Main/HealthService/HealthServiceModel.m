//
//  HealthServiceModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthServiceModel.h"

@implementation HealthServiceModel

+(HealthServiceModel *)createMenuIconPath:(NSString *)iconPath title:(NSString *)title
{
    HealthServiceModel *heaSerModel = [[HealthServiceModel alloc]init];
    heaSerModel.iconPath = iconPath;
    heaSerModel.title = title;
    return heaSerModel;
}

@end
