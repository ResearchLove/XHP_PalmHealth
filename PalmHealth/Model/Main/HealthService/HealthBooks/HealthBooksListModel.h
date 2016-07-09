//
//  HealthBooksListModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#define NULLSTRING @""

#import <Foundation/Foundation.h>


@interface HealthBooksListModel : NSObject

@property (copy,nonatomic) NSNumber *ids;        //<<<分类id
@property (copy,nonatomic) NSString *name;       //<<<名称
@property (copy,nonatomic) NSString *author;     //<<<作者
@property (copy,nonatomic) NSString *summary;    //<<<简介
@property (copy,nonatomic) NSString *img;        //<<<图片
@property (copy,nonatomic) NSNumber *bookclass;  //<<<分类
@property (copy,nonatomic) NSNumber *count;      //<<<访问数
@property (copy,nonatomic) NSNumber *rcount;     //<<<评论数
@property (copy,nonatomic) NSNumber *fcount;     //<<<收藏数
@property (copy,nonatomic) NSNumber *time;       //<<<发布时间


+(HealthBooksListModel *)readFromJosn:(NSDictionary *)josnDict;

@end
