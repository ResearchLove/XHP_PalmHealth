//
//  HealthBooksModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NULLSTRING @""

@interface HealthBooksModel : NSObject

@property (copy,nonatomic) NSNumber *ids;        //<<<分类id
@property (copy,nonatomic) NSString *name;       //<<<分类名称
@property (copy,nonatomic) NSString *seq;        //<<<分类的排序，从小到大的递增排序
@property (copy,nonatomic) NSString *title;      //<<<分类的标题
@property (copy,nonatomic) NSString *descriptions;//<<<分类的描述
@property (copy,nonatomic) NSString *keywords;    //<<<分类的关键词

+(HealthBooksModel *)readFromJosnObj:(NSDictionary *)josnDict;

@end
