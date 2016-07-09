//
//  HealthAnswerListModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthAnswerListModel.h"

@implementation HealthAnswerListModel

-(id)init
{
    self = [super init];
    if (self) {
        _ids = [NSNumber numberWithInt:0];
        _keywords = NULLSTRING;
        _title = NULLSTRING;
        _descriptions = NULLSTRING;
        _img = NULLSTRING;
        _askclass = [NSNumber numberWithInt:0];
        _count = [NSNumber numberWithInt:0];
        _rcount = [NSNumber numberWithInt:0];
        _fcount = [NSNumber numberWithInt:0];
        _time = [NSNumber numberWithLong:0];
    }
    return self;
}

+(HealthAnswerListModel *)readFromJosnObj:(NSDictionary *)josnDict
{
    NSDictionary *dict =josnDict;
    if (!dict) {
        return FALSE;
    }
    HealthAnswerListModel *heaAnsLisModel = [[HealthAnswerListModel alloc]init];
    if (dict[@"id"] != nil && [dict[@"id"] isKindOfClass:[NSNumber class]]) {
        heaAnsLisModel.ids = dict[@"id"];
    }
    
    if (dict[@"keywords"] != nil && [dict[@"keywords"] isKindOfClass:[NSString class]]) {
        heaAnsLisModel.keywords = dict[@"keywords"];
    }
    
    if (dict[@"title"] != nil && [dict[@"title"] isKindOfClass:[NSString class]]) {
        heaAnsLisModel.title = dict[@"title"];
    }
    
    if (dict[@"description"] != nil && [dict[@"description"] isKindOfClass:[NSString class]]) {
        heaAnsLisModel.descriptions = dict[@"description"];
    }
    
    if (dict[@"img"] != nil && [dict[@"img"] isKindOfClass:[NSString class]]) {
        heaAnsLisModel.img = dict[@"img"];
    }
    
    if (dict[@"askclass"] != nil && [dict[@"askclass"] isKindOfClass:[NSNumber class]]) {
        heaAnsLisModel.askclass = dict[@"askclass"];
    }
    
    if (dict[@"count"] != nil && [dict[@"count"] isKindOfClass:[NSNumber class]]) {
        heaAnsLisModel.count = dict[@"count"];
    }
    
    if (dict[@"rcount"] != nil && [dict[@"rcount"] isKindOfClass:[NSNumber class]]) {
        heaAnsLisModel.rcount = dict[@"rcount"];
    }
    
    if (dict[@"fcount"] != nil && [dict[@"fcount"] isKindOfClass:[NSNumber class]]) {
        heaAnsLisModel.fcount = dict[@"fcount"];
    }
    
    if (dict[@"time"] != nil && [dict[@"time"] isKindOfClass:[NSNumber class]]) {
        heaAnsLisModel.time = dict[@"time"];
    }
    return heaAnsLisModel;
}


@end
