//
//  WelfareHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/27.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "WelfareHelper.h"
#import "WelfareModel.h"

@implementation WelfareHelper

-(id)init
{
    self = [super init];
    if (self) {
        self.welfareItemDataAry = [[NSMutableArray alloc]init];
        [self initTextData];
    }
    return self;
}

-(void)initTextData
{
    WelfareModel *welfareModelOne = [WelfareModel createItemIconPath:@"diseaseConsulting" title:@"疾病咨询" detailsURL:nil];
    [self.welfareItemDataAry addObject:welfareModelOne];
    
    WelfareModel *welfareModelTwo = [WelfareModel createItemIconPath:@"international" title:@"春雨国际" detailsURL:@"http://www.cycares.com"];
    [self.welfareItemDataAry addObject:welfareModelTwo];
    
    WelfareModel *welfareModelThree = [WelfareModel createItemIconPath:@"makeAppointment" title:@"预约就诊" detailsURL:@"http://h.kyhtech.com/web/guahao/guahaoIndex1?uid=2499"];
    [self.welfareItemDataAry addObject:welfareModelThree];
    
    WelfareModel *welfareModelFore = [WelfareModel createItemIconPath:@"vaccine" title:@"疫苗接种点" detailsURL:@"http://news.qq.com/zt2016/vaccine/index.htm?uid=2499"];
    [self.welfareItemDataAry addObject:welfareModelFore];
    
    WelfareModel *welfareModelFive = [WelfareModel createItemIconPath:@"hospitalRankic" title:@"医院排名" detailsURL:@"http://h.kyhtech.com/web/guahao/hospitalDepTop?uid=2499"];
    [self.welfareItemDataAry addObject:welfareModelFive];
    
    WelfareModel *welfareModelSix = [WelfareModel createItemIconPath:@"putian" title:@"莆田系医院" detailsURL:@"http://h.kyhtech.com/web/putian?uid=2499"];
    [self.welfareItemDataAry addObject:welfareModelSix];

}

@end
