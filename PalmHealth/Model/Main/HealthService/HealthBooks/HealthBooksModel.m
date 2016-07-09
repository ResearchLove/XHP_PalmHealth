//
//  HealthBooksModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksModel.h"

@implementation HealthBooksModel

-(id)init
{
    self = [super init];
    if (self) {
        _ids = [NSNumber numberWithInt:0];
        _name = NULLSTRING;
        _seq = NULLSTRING;
        _title = NULLSTRING;
        _descriptions = NULLSTRING;
        _keywords = NULLSTRING;
    }
    return self;
}

+(HealthBooksModel *)readFromJosnObj:(NSDictionary *)josnDict
{
    NSDictionary *dict = josnDict;
    if (!dict) {
        return FALSE;
    }
    HealthBooksModel *heaBooModel = [[HealthBooksModel alloc]init];
    if (dict[@"id"] != nil && [dict[@"id"] isKindOfClass:[NSNumber class]]) {
        heaBooModel.ids = dict[@"id"];
    }
    if (dict[@"name"] != nil && [dict[@"name"] isKindOfClass:[NSString class]]) {
        heaBooModel.name = dict[@"name"];
    }
    if (dict[@"seq"] != nil && [dict[@"seq"] isKindOfClass:[NSString class]]) {
        heaBooModel.seq = dict[@"seq"];
    }
    if (dict[@"title"] != nil && [dict[@"title"] isKindOfClass:[NSString class]]) {
        heaBooModel.title = dict[@"title"];
    }
    if (dict[@"description"] != nil && [dict[@"description"] isKindOfClass:[NSString class]]) {
        heaBooModel.descriptions = dict[@"description"];
    }
    if (dict[@"keywords"] != nil && [dict[@"keywords"] isKindOfClass:[NSString class]]) {
        heaBooModel.keywords = dict[@"keywords"];
    }
    return heaBooModel;
    
}

@end
