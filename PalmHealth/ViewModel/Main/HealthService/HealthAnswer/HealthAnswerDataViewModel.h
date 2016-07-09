//
//  HealthAnswerDataViewModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//


#define HEALTHBOOKS_ASK_CLASSIFY_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/ask/classify"]
#define HEALTHBOOKS_ASK_LIST_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/ask/list"]
#define HEALTHBOOKS_ASK_SHOW_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/ask/show"]

#import <Foundation/Foundation.h>
#import "BaseDataViewModel.h"

@interface HealthAnswerDataViewModel : BaseDataViewModel


/**
 *  取得健康问答分类，可以通过分类id取得健康知识列表
 *
 */
- (void)requestHealthAnswerClassifySuccess:(void (^)(id data))success
                                      failure:(void (^)(NSString *error))failure;

/**
 *  取得健康问答列表，也可以用分类id作为参数
 *
 */
- (void)requestHealthAnswerListByPageIndex:(NSInteger)page
                                         rows:(NSInteger)rows
                                          ids:(NSInteger)ids
                                      success:(void (^)(id data))success
                                      failure:(void (^)(NSString *error))failure;

/**
 *  取得健康问答详情，通过知识id取得该对应详细内容信息
 *
 */
- (void)requestHealthAnswerDetailsById:(NSInteger)ids
                                  success:(void (^)(id data))success
                                  failure:(void (^)(NSString *error))failure;

@end
