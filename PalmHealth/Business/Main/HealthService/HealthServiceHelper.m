//
//  HealthServiceHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthServiceHelper.h"
#import "HealthServiceModel.h"

@implementation HealthServiceHelper

-(id)init
{
    if (self = [super init]) {
        self.healthServiceMenuData = [[NSMutableArray alloc]init];
        [self initTextData];
    }
    return self;
}

-(void)initTextData
{
    HealthServiceModel *heaSerModelOne = [HealthServiceModel createMenuIconPath:@"healthCircle" title:@"健康圈"];
    
    HealthServiceModel *heaSerModelTwo = [HealthServiceModel createMenuIconPath:@"healthInformation" title:@"健康资讯"];
    
    HealthServiceModel *heaSerModelThree = [HealthServiceModel createMenuIconPath:@"buyMedicine" title:@"快速购药"];
    
    HealthServiceModel *heaSerModelFour = [HealthServiceModel createMenuIconPath:@"lore" title:@"健康知识"];
    
    HealthServiceModel *heaSerModelFive = [HealthServiceModel createMenuIconPath:@"ask" title:@"健康问答"];
    
    HealthServiceModel *heaSerModelSix = [HealthServiceModel createMenuIconPath:@"book" title:@"健康图书"];
    
    
    [_healthServiceMenuData addObjectsFromArray:@[@[heaSerModelOne],@[heaSerModelTwo,heaSerModelFour,heaSerModelFive,heaSerModelSix],@[heaSerModelThree]]];

}

@end
