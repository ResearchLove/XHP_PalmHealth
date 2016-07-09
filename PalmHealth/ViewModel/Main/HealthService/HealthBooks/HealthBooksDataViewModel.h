//
//  HealthBooksDataViewModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#define HEALTHBOOKS_BOOK_CLASSIFY_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/book/classify"]
#define HEALTHBOOKS_BOOK_LIST_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/book/list"]
#define HEALTHBOOKS_BOOK_SHOW_URL [HEALTHKNOWLEDGE_HOST_URL stringByAppendingString:@"/book/show"]



#import "BaseDataViewModel.h"

@interface HealthBooksDataViewModel : BaseDataViewModel




/**
 *  取得健康知识分类，可以通过分类id取得健康知识列表
 *
 */
- (void)requestHealthBooksClassifySuccess:(void (^)(id data))success
                                      failure:(void (^)(NSString *error))failure;

/**
 *  取得知识列表，也可以用分类id作为参数
 *
 */
- (void)requestHealthBooksListByPageIndex:(NSInteger)page
                                         rows:(NSInteger)rows
                                          ids:(NSInteger)ids
                                      success:(void (^)(id data))success
                                      failure:(void (^)(NSString *error))failure;

/**
 *  取得健康知识详情，通过知识id取得该对应详细内容信息
 *
 */
- (void)requestHealthBooksDetailsById:(NSInteger)ids
                                  success:(void (^)(id data))success
                                  failure:(void (^)(NSString *error))failure;


@end
