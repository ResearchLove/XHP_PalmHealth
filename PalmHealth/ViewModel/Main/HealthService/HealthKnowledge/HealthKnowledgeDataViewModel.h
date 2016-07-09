//
//  HealthKnowledgeDataViewModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDataViewModel.h"


#define HEALTHKNOWLEDGE_LORE_CLASSIFY_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/lore/classify"]
#define HEALTHKNOWLEDGE_LORE_LIST_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/lore/list"]
#define HEALTHKNOWLEDGE_LORE_SHOW_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/lore/show"]

@interface HealthKnowledgeDataViewModel : BaseDataViewModel

/**
 *  取得健康知识分类，可以通过分类id取得健康知识列表
 *
 */
- (void)requestHealthKnowledgeClassifySuccess:(void (^)(id data))success
                                       failure:(void (^)(NSString *error))failure;

/**
 *  取得知识列表，也可以用分类id作为参数
 *
 */
- (void)requestHealthKnowledgeListByPageIndex:(NSInteger)page
                                         rows:(NSInteger)rows
                                           ids:(NSInteger)ids
                                       success:(void (^)(id data))success
                                       failure:(void (^)(NSString *error))failure;

/**
 *  取得健康知识详情，通过知识id取得该对应详细内容信息
 *
 */
- (void)requestHealthKnowledgeDetailsById:(NSInteger)ids
                                       success:(void (^)(id data))success
                                       failure:(void (^)(NSString *error))failure;


@end
