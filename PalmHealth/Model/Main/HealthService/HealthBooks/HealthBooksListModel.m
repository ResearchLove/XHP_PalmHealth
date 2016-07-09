//
//  HealthBooksListModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksListModel.h"

@implementation HealthBooksListModel

-(id)init
{
    if (self = [super init]) {
        _ids = [NSNumber numberWithInt:0];
        _name = NULLSTRING;
        _author = NULLSTRING;
        _summary = NULLSTRING;
        _img = NULLSTRING;
        _bookclass = [NSNumber numberWithInt:0];
        _count =  [NSNumber numberWithInt:0];
        _rcount = [NSNumber numberWithInt:0];
        _fcount = [NSNumber numberWithInt:0];
        _time =  [NSNumber numberWithInt:0];
    }
    return self;
}

+(HealthBooksListModel *)readFromJosn:(NSDictionary *)josnDict
{
    NSDictionary *dict = josnDict;
    if (!dict) {
        return FALSE;
    }
    HealthBooksListModel *heaBooLisModel = [[HealthBooksListModel alloc]init];
    if (dict[@"id"] != nil && [dict[@"id"] isKindOfClass:[NSNumber class]]) {
        heaBooLisModel.ids = dict[@"id"];
    }
    if (dict[@"name"] != nil && [dict[@"name"] isKindOfClass:[NSString class]]) {
        heaBooLisModel.name = dict[@"name"];
    }
    if (dict[@"author"] != nil && [dict[@"author"] isKindOfClass:[NSString class]]) {
        heaBooLisModel.author = dict[@"author"];
    }
    if (dict[@"summary"] != nil && [dict[@"summary"] isKindOfClass:[NSString class]]) {
        heaBooLisModel.summary = dict[@"summary"];
    }
    if (dict[@"img"] != nil && [dict[@"img"] isKindOfClass:[NSString class]]) {
        heaBooLisModel.img = dict[@"img"];
    }
    if (dict[@"bookclass"] != nil && [dict[@"bookclass"] isKindOfClass:[NSNumber class]]) {
        heaBooLisModel.bookclass = dict[@"bookclass"];
    }
    if (dict[@"count"] != nil && [dict[@"count"] isKindOfClass:[NSNumber class]]) {
        heaBooLisModel.count = dict[@"count"];
    }
    if (dict[@"rcount"] != nil && [dict[@"rcount"] isKindOfClass:[NSNumber class]]) {
        heaBooLisModel.rcount = dict[@"rcount"];
    }
    if (dict[@"fcount"] != nil && [dict[@"fcount"] isKindOfClass:[NSNumber class]]) {
        heaBooLisModel.fcount = dict[@"fcount"];
    }
    if (dict[@"time"] != nil && [dict[@"time"] isKindOfClass:[NSNumber class]]) {
        heaBooLisModel.time = dict[@"time"];
    }
    return heaBooLisModel;

}

@end
