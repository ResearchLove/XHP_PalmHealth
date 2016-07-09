//
//  HealthAnswerDataViewModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthAnswerDataViewModel.h"
#import "HealthKnowledgeModel.h"
#import "HealthAnswerListModel.h"
#import "HealthKnowledgeDetailsModel.h"

@implementation HealthAnswerDataViewModel

- (void)requestHealthAnswerClassifySuccess:(void (^)(id data))success
                                      failure:(void (^)(NSString *error))failure
{
    [Networking postUrl:HEALTHBOOKS_ASK_CLASSIFY_URL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)requestHealthAnswerListByPageIndex:(NSInteger)page
                                         rows:(NSInteger)rows
                                          ids:(NSInteger)ids
                                      success:(void (^)(id data))success
                                      failure:(void (^)(NSString *error))failure
{
    NSDictionary *dataDict = @{@"page":[NSString stringWithFormat:@"%ld",page],
                               @"rows":[NSString stringWithFormat:@"%ld",rows],
                               @"id":[NSString stringWithFormat:@"%ld",ids]};
    [Networking postUrl:HEALTHBOOKS_ASK_LIST_URL parameters:dataDict success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject == %@",(NSString *)responseObject);
        NSDictionary *resultDict = [DataToDictionary dataToDict:responseObject];
        if ([resultDict[@"status"] intValue] == 1) {
            NSMutableArray *data = [[NSMutableArray alloc]init];
            for (NSDictionary *heaHnoLisDict in (NSArray *)resultDict[@"tngou"]) {
                HealthAnswerListModel *heaAnsLisModel = [HealthAnswerListModel readFromJosnObj:heaHnoLisDict];
                [data addObject:heaAnsLisModel];
            }
            success(data);
        }else{
            failure(resultDict[@"status"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(@"网络异常");
    }];
}


- (void)requestHealthAnswerDetailsById:(NSInteger)ids
                                  success:(void (^)(id data))success
                                  failure:(void (^)(NSString *error))failure
{
    NSDictionary *dataDict = @{@"id":[NSString stringWithFormat:@"%ld",ids]};
    [Networking postUrl:HEALTHBOOKS_ASK_SHOW_URL parameters:dataDict success:^(NSURLSessionDataTask *task, id responseObject) {
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
