//
//  HealthBooksDetailsModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#define NULLSTRING @""

#import <Foundation/Foundation.h>

@interface HealthBooksContentsModel : NSObject

@property (copy,nonatomic) NSNumber *book;
@property (copy,nonatomic) NSNumber *ids;
@property (copy,nonatomic) NSString *message;
@property (copy,nonatomic) NSNumber *seq;
@property (copy,nonatomic) NSString *title;

+(HealthBooksContentsModel *)readFromJosnObj:(NSDictionary *)josnDict;

@end

@interface HealthBooksDetailsModel : NSObject

@property (strong,nonatomic) NSNumber *ids;            //<<<ID编码
@property (strong,nonatomic) NSString *name;           //<<<名称
@property (strong,nonatomic) NSString *author;         //<<<作者
@property (strong,nonatomic) NSString *summary;        //<<<简介
@property (strong,nonatomic) NSString *img;            //<<<图片
@property (strong,nonatomic) NSNumber *bookclass;      //<<<分类
@property (strong,nonatomic) NSNumber *count;          //<<<访问数
@property (strong,nonatomic) NSNumber *rcount;         //<<<评论数
@property (strong,nonatomic) NSNumber *fcount;         //<<<收藏数
@property (strong,nonatomic) NSNumber *time;           //<<<发布时间
@property (strong,nonatomic) NSMutableArray *listAry;  //<<<章节类容

+(HealthBooksDetailsModel *)readFromJosnObj:(NSDictionary *)josnDict;


@end
