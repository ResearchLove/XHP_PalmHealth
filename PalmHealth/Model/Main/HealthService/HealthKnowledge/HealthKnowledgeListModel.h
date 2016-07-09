//
//  HealthKnowledgeListModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#define NULLSTRING @""

#import <Foundation/Foundation.h>

@interface HealthKnowledgeListModel : NSObject

@property (copy,nonatomic) NSNumber *ids;          //<<<ID编码
@property (copy,nonatomic) NSString *keywords;     //<<<关键词
@property (copy,nonatomic) NSString *title;        //<<<标题
@property (copy,nonatomic) NSString *descriptions; //<<<简介
@property (copy,nonatomic) NSString *img;          //<<<图片
@property (copy,nonatomic) NSNumber *loreclass;    //<<<分类
@property (copy,nonatomic) NSNumber *count;        //<<<访问数
@property (copy,nonatomic) NSNumber *rcount;       //<<<评论数
@property (copy,nonatomic) NSNumber *fcount;       //<<<收藏数
@property (copy,nonatomic) NSNumber *time;         //<<<发布时间

+(HealthKnowledgeListModel *)readFromJosnObj:(NSDictionary *)josnDict;

@end
