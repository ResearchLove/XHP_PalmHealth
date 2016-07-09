//
//  PersonalCenterModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/1.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PersonalCenterModel.h"

@implementation PersonalCenterModel

+(PersonalCenterModel *)createMenuIconPath:(NSString *)iconPath title:(NSString *)title
{
    PersonalCenterModel *perCenModel = [[PersonalCenterModel alloc]init];
    perCenModel.imageURL = iconPath;
    perCenModel.title = title;
    return perCenModel;
}

@end
