//
//  PersonalInfomationModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/8.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PersonalInfomationModel.h"

@implementation PersonalInfomationModel

+(PersonalInfomationModel *)createMenuTitle:(NSString *)title contents:(NSString *)contents
{
    PersonalInfomationModel *perInfModel = [[PersonalInfomationModel alloc]init];
    perInfModel.title = title;
    perInfModel.contents = contents;
    return perInfModel;

}



@end
