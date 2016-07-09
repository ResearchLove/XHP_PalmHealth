//
//  PersonalCenterHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/1.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PersonalCenterHelper.h"

@implementation PersonalCenterHelper

-(id)init
{
    self = [super init];
    if (self) {
        self.dataAry = [[NSMutableArray alloc]init];
        [self initTextData];
    }
    return self;
}

-(void)initTextData
{
    PersonalCenterModel *perCenModelOne = [PersonalCenterModel createMenuIconPath:@"header" title:@"肖海平"];

    PersonalCenterModel *perCenModelTwo = [PersonalCenterModel createMenuIconPath:@"archives" title:@"健康档案"];
    
    PersonalCenterModel *perCenModelThree = [PersonalCenterModel createMenuIconPath:@"collection" title:@"我的优惠券"];
    
    PersonalCenterModel *perCenModelFour = [PersonalCenterModel createMenuIconPath:@"order" title:@"我的订单"];
    
    PersonalCenterModel *perCenModelFive = [PersonalCenterModel createMenuIconPath:@"moreMyFavorites" title:@"收藏"];
    
    PersonalCenterModel *perCenModelSix = [PersonalCenterModel createMenuIconPath:@"setting" title:@"设置"];
    
    [self.dataAry addObjectsFromArray:@[@[perCenModelOne],@[perCenModelTwo,perCenModelThree,perCenModelFour,perCenModelFive],@[perCenModelSix]]];

}

@end
