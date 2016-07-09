//
//  HealthKnowledgeModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeModel.h"

@implementation HealthKnowledgeModel

-(id)init
{
    self =  [super init];
    if (self) {
        _ids = [NSNumber numberWithInt:0];
        _name = NULLSTRING;
        _title = NULLSTRING;
        _keywords = NULLSTRING;
        _descriptions = NULLSTRING;
        _seq = [NSNumber numberWithInt:0];
    }
    return self;
}

+(HealthKnowledgeModel *)readFormJosnObj:(NSDictionary *)josnDict
{
    NSDictionary *dict = josnDict;
    if (!dict) {
        return FALSE;
    }
    HealthKnowledgeModel *heaKnoModel = [[HealthKnowledgeModel alloc]init];
    if (dict[@"id"] != nil && [dict[@"id"] isKindOfClass:[NSNumber class]]) {
        heaKnoModel.ids = dict[@"id"];
    }
    if (dict[@"name"] != nil && [dict[@"name"] isKindOfClass:[NSString class]]) {
        heaKnoModel.name = dict[@"name"];
    }
    if (dict[@"title"] != nil && [dict[@"title"] isKindOfClass:[NSString class]]) {
        heaKnoModel.title = dict[@"title"];
    }
    if (dict[@"keywords"] != nil && [dict[@"keywords"] isKindOfClass:[NSString class]]) {
        heaKnoModel.keywords = dict[@"keywords"];
    }
    if (dict[@"description"] != nil && [dict[@"description"] isKindOfClass:[NSString class]]) {
        heaKnoModel.descriptions = dict[@"description"];
    }
    if (dict[@"seq"] != nil && [dict[@"seq"] isKindOfClass:[NSNumber class]]) {
        heaKnoModel.seq = dict[@"seq"];
    }
    return heaKnoModel;
}

@end
