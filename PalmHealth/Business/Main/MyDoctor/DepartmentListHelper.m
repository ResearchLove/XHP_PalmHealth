//
//  DepartmentListHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/22.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "DepartmentListHelper.h"
#import "HealthServiceModel.h"

@implementation DepartmentListHelper

-(id)init
{
    self = [super init];
    if (self) {
        self.departmentAry = [[NSMutableArray alloc]init];
        [self initTextData];
    }
    return self;
}

-(void)initTextData
{
    HealthServiceModel *heaSerModelOne = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"外科专家"];
    [self.departmentAry addObject:heaSerModelOne];
    
    HealthServiceModel *heaInfModelTwo = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"核医学科专家"];
    [self.departmentAry addObject:heaInfModelTwo];
    
    HealthServiceModel *heaInfModelThree = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"耳鼻喉科专家"];
    [self.departmentAry addObject:heaInfModelThree];
    
    HealthServiceModel *heaInfModelFour = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"普外科专家"];
    [self.departmentAry addObject:heaInfModelFour];
    
    HealthServiceModel *heaInfModelFive = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"眼科专家"];
    [self.departmentAry addObject:heaInfModelFive];
    
    HealthServiceModel *heaInfModelSix = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"创伤骨科专家"];
    [self.departmentAry addObject:heaInfModelSix];
    
    HealthServiceModel *heaInfModelSeven = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"妇科专家"];
    [self.departmentAry addObject:heaInfModelSeven];
    
    HealthServiceModel *heaInfModelEight = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"康复科专家"];
    [self.departmentAry addObject:heaInfModelEight];
    
}



@end
