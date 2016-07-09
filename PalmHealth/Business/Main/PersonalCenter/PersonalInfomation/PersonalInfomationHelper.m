//
//  PersonalInfomationHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/8.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PersonalInfomationHelper.h"
#import "PersonalInfomationModel.h"

@implementation PersonalInfomationHelper

-(id)init
{
    self = [super init];
    if (self) {
        self.dataAry = [[NSMutableArray alloc]init];
        [self initTextData];
    }
    return self;
}

-(void)initTextData;
{
    PersonalInfomationModel *perInfModelOne = [PersonalInfomationModel createMenuTitle:@"头像" contents:@"header"];
    PersonalInfomationModel *perInfModelTwo = [PersonalInfomationModel createMenuTitle:@"姓名" contents:@"肖海平"];
    PersonalInfomationModel *perInfModelThree = [PersonalInfomationModel createMenuTitle:@"手机号" contents:@"15295529134"];
    PersonalInfomationModel *perInfModelFour = [PersonalInfomationModel createMenuTitle:@"邮箱" contents:@"15295529134@qq.com"];
    [self.dataAry addObjectsFromArray:@[perInfModelOne,perInfModelTwo,perInfModelThree,perInfModelFour]];
    
}

@end
