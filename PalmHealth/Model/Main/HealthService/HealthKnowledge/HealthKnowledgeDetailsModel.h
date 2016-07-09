//
//  HealthKnowledgeDetailsModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NULLSTRING @""

@interface HealthKnowledgeDetailsModel : NSObject

@property (copy,nonatomic) NSNumber *ids;          //<<<ID编码
@property (copy,nonatomic) NSString *title;        //<<<标题
@property (copy,nonatomic) NSString *img;          //<<<图片
@property (copy,nonatomic) NSNumber *loreclass;    //<<<分类
@property (copy,nonatomic) NSString *keywords;     //<<<关键词
@property (copy,nonatomic) NSString *descriptions; //<<<描述
@property (copy,nonatomic) NSString *message;      //<<<内容
@property (copy,nonatomic) NSNumber *count;        //<<<访问数
@property (copy,nonatomic) NSNumber *rcount;       //<<<评论数
@property (copy,nonatomic) NSNumber *fcount;       //<<<收藏数
@property (copy,nonatomic) NSNumber *time;         //<<<发布时间

+(HealthKnowledgeDetailsModel *)readFromJosnObj:(NSDictionary *)josnDict;

@end
