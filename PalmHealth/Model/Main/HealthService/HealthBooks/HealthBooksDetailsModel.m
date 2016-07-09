//
//  HealthBooksDetailsModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksDetailsModel.h"

@implementation HealthBooksContentsModel
-(id)init
{
    self = [super init];
    if (self) {
        _book = [NSNumber numberWithInt:0];
        _ids = [NSNumber numberWithInt:0];
        _message = NULLSTRING;
        _seq = [NSNumber numberWithInt:0];
        _title = NULLSTRING;;
    }
    return self;
}

+(HealthBooksContentsModel *)readFromJosnObj:(NSDictionary *)josnDict
{
    NSDictionary *dict = josnDict;
    if (!dict) {
        return FALSE;
    }
    
    HealthBooksContentsModel *heaBooConModel = [[HealthBooksContentsModel alloc]init];
    if (dict[@"book"] != nil && [dict[@"book"] isKindOfClass:[NSNumber class]]) {
        heaBooConModel.book = dict[@"book"];
    }
    if (dict[@"id"] != nil && [dict[@"id"] isKindOfClass:[NSNumber class]]) {
        heaBooConModel.ids = dict[@"id"];
    }
    if (dict[@"message"] != nil && [dict[@"message"] isKindOfClass:[NSString class]]) {
        heaBooConModel.message = dict[@"message"];
    }
    if (dict[@"seq"] != nil && [dict[@"seq"] isKindOfClass:[NSNumber class]]) {
        heaBooConModel.seq = dict[@"seq"];
    }
    if (dict[@"title"] != nil && [dict[@"title"] isKindOfClass:[NSString class]]) {
        heaBooConModel.title = dict[@"title"];
    }
    return heaBooConModel;
}

@end


@implementation HealthBooksDetailsModel

-(id)init
{
    if (self = [super init]) {
        _ids = [NSNumber numberWithInt:0];
        _name = NULLSTRING;
        _author = NULLSTRING;
        _summary = NULLSTRING;
        _img = NULLSTRING;
        _bookclass = [NSNumber numberWithInt:0];
        _count = [NSNumber numberWithInt:0];;
        _rcount = [NSNumber numberWithInt:0];;
        _fcount = [NSNumber numberWithInt:0];;
        _time = [NSNumber numberWithInt:0];;
    }
    return self;
}

+(HealthBooksDetailsModel *)readFromJosnObj:(NSDictionary *)josnDict
{

    NSDictionary *dict = josnDict;
    if (!dict) {
        return FALSE;
    }
    
    HealthBooksDetailsModel *heaBooDetModel = [[HealthBooksDetailsModel alloc]init];
    if (dict[@"id"] != nil && [dict[@"id"] isKindOfClass:[NSNumber class]]) {
        heaBooDetModel.ids = dict[@"id"];
    }
    if (dict[@"name"] != nil && [dict[@"name"] isKindOfClass:[NSString class]]) {
        heaBooDetModel.name = dict[@"name"];
    }
    if (dict[@"author"] != nil && [dict[@"author"] isKindOfClass:[NSString class]]) {
        heaBooDetModel.author = dict[@"author"];
    }
    if (dict[@"summary"] != nil && [dict[@"summary"] isKindOfClass:[NSString class]]) {
        heaBooDetModel.summary = dict[@"summary"];
    }
    if (dict[@"img"] != nil && [dict[@"img"] isKindOfClass:[NSString class]]) {
        heaBooDetModel.img = dict[@"img"];
    }
    if (dict[@"bookclass"] != nil && [dict[@"bookclass"] isKindOfClass:[NSNumber class]]) {
        heaBooDetModel.bookclass = dict[@"bookclass"];
    }
    if (dict[@"count"] != nil && [dict[@"count"] isKindOfClass:[NSNumber class]]) {
        heaBooDetModel.count = dict[@"count"];
    }
    if (dict[@"rcount"] != nil && [dict[@"rcount"] isKindOfClass:[NSNumber class]]) {
        heaBooDetModel.rcount = dict[@"rcount"];
    }
    if (dict[@"fcount"] != nil && [dict[@"fcount"] isKindOfClass:[NSNumber class]]) {
        heaBooDetModel.fcount = dict[@"fcount"];
    }
    if (dict[@"time"] != nil && [dict[@"time"] isKindOfClass:[NSNumber class]]) {
        heaBooDetModel.time = dict[@"time"];
    }
    if (dict[@"list"] != nil && [dict[@"list"] isKindOfClass:[NSArray class]]) {
        heaBooDetModel.listAry = [NSMutableArray array];
        for (NSDictionary *listDict in (NSArray *)dict[@"list"]) {
            HealthBooksContentsModel *heaBooConModel = [HealthBooksContentsModel readFromJosnObj:listDict];
            [heaBooDetModel.listAry addObject:heaBooConModel];
        }
    }
    return heaBooDetModel;

}

@end
