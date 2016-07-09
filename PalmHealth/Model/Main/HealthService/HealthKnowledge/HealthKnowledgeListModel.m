//
//  HealthKnowledgeListModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeListModel.h"

@implementation HealthKnowledgeListModel

-(id)init
{
    self = [super init];
    if (self) {
        _ids = [NSNumber numberWithInt:0];
        _keywords = NULLSTRING;
        _title = NULLSTRING;
        _descriptions = NULLSTRING;
        _img = NULLSTRING;
        _loreclass = [NSNumber numberWithInt:0];
        _count = [NSNumber numberWithInt:0];
        _rcount = [NSNumber numberWithInt:0];
        _fcount = [NSNumber numberWithInt:0];
        _time = [NSNumber numberWithLong:0];
    }
  return self;
}

+(HealthKnowledgeListModel *)readFromJosnObj:(NSDictionary *)josnDict
{
    NSDictionary *dict =josnDict;
    if (!dict) {
        return FALSE;
    }
    HealthKnowledgeListModel *heaKnoLisModel = [[HealthKnowledgeListModel alloc]init];
    if (dict[@"id"] != nil && [dict[@"id"] isKindOfClass:[NSNumber class]]) {
        heaKnoLisModel.ids = dict[@"id"];
    }
    
    if (dict[@"keywords"] != nil && [dict[@"keywords"] isKindOfClass:[NSString class]]) {
        heaKnoLisModel.keywords = dict[@"keywords"];
    }

    if (dict[@"title"] != nil && [dict[@"title"] isKindOfClass:[NSString class]]) {
        heaKnoLisModel.title = dict[@"title"];
    }

    if (dict[@"description"] != nil && [dict[@"description"] isKindOfClass:[NSString class]]) {
        heaKnoLisModel.descriptions = dict[@"description"];
    }

    if (dict[@"img"] != nil && [dict[@"img"] isKindOfClass:[NSString class]]) {
        heaKnoLisModel.img = dict[@"img"];
    }

    if (dict[@"loreclass"] != nil && [dict[@"loreclass"] isKindOfClass:[NSNumber class]]) {
        heaKnoLisModel.loreclass = dict[@"loreclass"];
    }

    if (dict[@"count"] != nil && [dict[@"count"] isKindOfClass:[NSNumber class]]) {
        heaKnoLisModel.count = dict[@"count"];
    }

    if (dict[@"rcount"] != nil && [dict[@"rcount"] isKindOfClass:[NSNumber class]]) {
        heaKnoLisModel.rcount = dict[@"rcount"];
    }
    
    if (dict[@"fcount"] != nil && [dict[@"fcount"] isKindOfClass:[NSNumber class]]) {
        heaKnoLisModel.fcount = dict[@"fcount"];
    }
    
    if (dict[@"time"] != nil && [dict[@"time"] isKindOfClass:[NSNumber class]]) {
        heaKnoLisModel.time = dict[@"time"];
    }
    return heaKnoLisModel;
}

@end
