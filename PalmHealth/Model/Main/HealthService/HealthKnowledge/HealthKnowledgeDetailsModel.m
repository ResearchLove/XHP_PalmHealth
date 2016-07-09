//
//  HealthKnowledgeDetailsModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeDetailsModel.h"

@implementation HealthKnowledgeDetailsModel

-(id)init
{
    self = [super init];
    if (self) {
        _ids = [NSNumber numberWithInt:0];
        _title = NULLSTRING;
        _img = NULLSTRING;
        _loreclass = [NSNumber numberWithInt:0];
        _keywords = NULLSTRING;
        _descriptions = NULLSTRING;
        _message = NULLSTRING;
        _count = [NSNumber numberWithInt:0];
        _rcount = [NSNumber numberWithInt:0];
        _fcount = [NSNumber numberWithInt:0];
        _time = [NSNumber numberWithLong:0];
    }
    return self;
}

+ (HealthKnowledgeDetailsModel *)readFromJosnObj:(NSDictionary *)josnDict
{
    NSDictionary *dict = josnDict;
    if (!dict) {
        return FALSE;
    }
    HealthKnowledgeDetailsModel *heaKnoDetModel = [[HealthKnowledgeDetailsModel alloc]init];
    if (dict[@"id"] != nil && [dict[@"id"] isKindOfClass:[NSNumber class]]) {
        heaKnoDetModel.ids = dict[@"id"];
    }
    
    if (dict[@"title"] != nil && [dict[@"title"] isKindOfClass:[NSString class]]) {
        heaKnoDetModel.title = dict[@"title"];
    }
    
    if (dict[@"img"] != nil && [dict[@"img"] isKindOfClass:[NSString class]]) {
        heaKnoDetModel.img = dict[@"img"];
    }
    
    if (dict[@"loreclass"] != nil && [dict[@"loreclass"] isKindOfClass:[NSNumber class]]) {
        heaKnoDetModel.loreclass = dict[@"loreclass"];
    }
    
    if (dict[@"keywords"] != nil && [dict[@"keywords"] isKindOfClass:[NSString class]]) {
        heaKnoDetModel.keywords = dict[@"keywords"];
    }
    
    if (dict[@"description"] != nil && [dict[@"description"] isKindOfClass:[NSString class]]) {
        heaKnoDetModel.descriptions = dict[@"description"];
    }
    
    if (dict[@"message"] != nil && [dict[@"message"] isKindOfClass:[NSString class]]) {
        heaKnoDetModel.message = dict[@"message"];
    }
    
    if (dict[@"count"] != nil && [dict[@"count"] isKindOfClass:[NSNumber class]]) {
        heaKnoDetModel.count = dict[@"count"];
    }
    
    if (dict[@"rcount"] != nil && [dict[@"rcount"] isKindOfClass:[NSNumber class]]) {
        heaKnoDetModel.rcount = dict[@"rcount"];
    }
    
    if (dict[@"fcount"] != nil && [dict[@"fcount"] isKindOfClass:[NSNumber class]]) {
        heaKnoDetModel.fcount = dict[@"fcount"];
    }
    
    if (dict[@"time"] != nil && [dict[@"time"] isKindOfClass:[NSNumber class]]) {
        heaKnoDetModel.time = dict[@"time"];
    }
    return heaKnoDetModel;
}

@end
