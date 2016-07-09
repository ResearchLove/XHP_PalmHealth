//
//  HealthKnowledgeDataViewModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeDataViewModel.h"
#import "HealthKnowledgeModel.h"
#import "HealthKnowledgeListModel.h"
#import "HealthKnowledgeDetailsModel.h"

@implementation HealthKnowledgeDataViewModel

- (void)requestHealthKnowledgeClassifySuccess:(void (^)(id data))success
                                      failure:(void (^)(NSString *error))failure
{
    [Networking postUrl:HEALTHKNOWLEDGE_LORE_CLASSIFY_URL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject == %@",[DataToDictionary dataToDict:responseObject]);
        NSDictionary *resultDict = [DataToDictionary dataToDict:responseObject];
        if ([resultDict[@"status"] intValue] == 1) {
            NSMutableArray *data = [[NSMutableArray alloc]init];
            for (NSDictionary *heaHnoDict in (NSArray *)resultDict[@"tngou"]) {
                HealthKnowledgeModel *heaHnoModel = [HealthKnowledgeModel readFormJosnObj:heaHnoDict];
                [data addObject:heaHnoModel];
            }
            success(data);
        }else{
            failure(resultDict[@"status"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
          failure(@"网络异常");
    }];


}

- (void)requestHealthKnowledgeListByPageIndex:(NSInteger)page
                                         rows:(NSInteger)rows
                                           ids:(NSInteger)ids
                                      success:(void (^)(id data))success
                                      failure:(void (^)(NSString *error))failure
{
    NSDictionary *dataDict = @{@"page":[NSString stringWithFormat:@"%ld",page],
                               @"rows":[NSString stringWithFormat:@"%ld",rows],
                               @"id":[NSString stringWithFormat:@"%ld",ids]};
    [Networking postUrl:HEALTHKNOWLEDGE_LORE_LIST_URL parameters:dataDict success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject == %@",(NSString *)responseObject);
        NSDictionary *resultDict = [DataToDictionary dataToDict:responseObject];
        if ([resultDict[@"status"] intValue] == 1) {
            NSMutableArray *data = [[NSMutableArray alloc]init];
            for (NSDictionary *heaHnoLisDict in (NSArray *)resultDict[@"tngou"]) {
                HealthKnowledgeListModel *heaHnoLisModel = [HealthKnowledgeListModel readFromJosnObj:heaHnoLisDict];
                [data addObject:heaHnoLisModel];
            }
            success(data);
        }else{
            failure(resultDict[@"status"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(@"网络异常");
    }];
}


- (void)requestHealthKnowledgeDetailsById:(NSInteger)ids
                                success:(void (^)(id data))success
                                failure:(void (^)(NSString *error))failure
{
    NSDictionary *dataDict = @{@"id":[NSString stringWithFormat:@"%ld",ids]};
    [Networking postUrl:HEALTHKNOWLEDGE_LORE_SHOW_URL parameters:dataDict success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject == %@",(NSString *)responseObject);
        NSDictionary *resultDict = [DataToDictionary dataToDict:responseObject];
        if ([resultDict[@"status"] intValue] == 1) {
            HealthKnowledgeDetailsModel *heaHnoDetModel = [HealthKnowledgeDetailsModel readFromJosnObj:resultDict];
            success(heaHnoDetModel);
        }else{
            failure(resultDict[@"status"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(@"网络异常");
    }];
}

@end
