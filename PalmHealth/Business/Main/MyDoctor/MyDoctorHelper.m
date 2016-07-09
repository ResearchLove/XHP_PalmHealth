//
//  MyDoctorHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/21.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "MyDoctorHelper.h"
#import "HealthServiceModel.h"
#import "WHC_ModelSqlite.h"
#import "MyDoctorModel.h"
#import "FormattingMyDoctorDataHelper.h"

@implementation MyDoctorHelper

-(id)init
{
    self = [super init];
    if (self) {
        self.funcionGroupAry = [[NSMutableArray alloc]init];
        self.myDoctorListAry = [[NSArray alloc]init];
        self.dataAry = [[NSMutableArray alloc]init];
        self.sectionAry = [[NSMutableArray alloc]init];
        [self initTextData];
    }
    return self;
}

-(void)initTextData
{
     HealthServiceModel *addHeaSerModel = [HealthServiceModel createMenuIconPath:@"addMyDoctor" title:@"找医生"];
    [self.funcionGroupAry addObject:addHeaSerModel];
    
    self.myDoctorListAry = [WHC_ModelSqlite query:[MyDoctorModel class] where:nil];
    
    self.dataAry = [FormattingMyDoctorDataHelper getMyDoctorListDataBy:[NSMutableArray arrayWithArray:_myDoctorListAry]];
    self.sectionAry = [FormattingMyDoctorDataHelper getMyDoctorListSectionBy:_dataAry];
    
}

@end
