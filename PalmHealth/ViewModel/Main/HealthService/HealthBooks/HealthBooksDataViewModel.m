//
//  HealthBooksDataViewModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksDataViewModel.h"
#import "HealthBooksModel.h"
#import "HealthBooksListModel.h"
#import "HealthBooksDetailsModel.h"

@implementation HealthBooksDataViewModel

-(void)requestHealthBooksClassifySuccess:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    
    [Networking postUrl:HEALTHBOOKS_BOOK_CLASSIFY_URL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject == %@",[DataToDictionary dataToDict:responseObject]);
        NSDictionary *resultDict = [DataToDictionary dataToDict:responseObject];
        if ([resultDict[@"status"] intValue] == 1) {
            NSMutableArray *data = [[NSMutableArray alloc]init];
            for (NSDictionary *heaBooDict in (NSArray *)resultDict[@"tngou"]) {
                HealthBooksModel *heaBooModel = [HealthBooksModel readFromJosnObj:heaBooDict];
                [data addObject:heaBooModel];
            }
            success(data);
        }else{
            failure(resultDict[@"status"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
         failure(@"网络异常");
    } ];
}

-(void)requestHealthBooksListByPageIndex:(NSInteger)page rows:(NSInteger)rows ids:(NSInteger)ids success:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    NSDictionary *dataDict = @{@"page":[NSString stringWithFormat:@"%ld",page],
                               @"rows":[NSString stringWithFormat:@"%ld",rows],
                               @"id":[NSString stringWithFormat:@"%ld",ids]};
    [Networking postUrl:HEALTHBOOKS_BOOK_LIST_URL parameters:dataDict success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject == %@",(NSString *)responseObject);
        NSDictionary *resultDict = [DataToDictionary dataToDict:responseObject];
        if ([resultDict[@"status"] intValue] == 1) {
            NSMutableArray *data = [[NSMutableArray alloc]init];
            for (NSDictionary *heaBooLisDict in (NSArray *)resultDict[@"list"]) {
                HealthBooksListModel *heaBooLisModel = [HealthBooksListModel readFromJosn:heaBooLisDict];
                [data addObject:heaBooLisModel];
            }
            success(data);
        }else{
            failure(resultDict[@"status"]);
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
         failure(@"网络异常");
    }];
}

-(void)requestHealthBooksDetailsById:(NSInteger)ids success:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    NSDictionary *dataDict = @{@"id":[NSString stringWithFormat:@"%ld",ids]};
    [Networking postUrl:HEALTHBOOKS_BOOK_SHOW_URL parameters:dataDict success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject == %@",(NSString *)responseObject);
        NSDictionary *resultDict = [DataToDictionary dataToDict:responseObject];
        if ([resultDict[@"status"] intValue] == 1) {
            HealthBooksDetailsModel *heaBooDetModel = [HealthBooksDetailsModel readFromJosnObj:resultDict];
            success(heaBooDetModel);
        }else{
            failure(resultDict[@"status"]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(@"网络异常");
    }];


}


@end
