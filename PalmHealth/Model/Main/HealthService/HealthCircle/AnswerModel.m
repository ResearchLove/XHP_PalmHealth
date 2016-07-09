//
//  AnswerModel.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/13.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "AnswerModel.h"

@implementation AnswerModel

-(instancetype)init
{
    self = [super init];
    if (self) {
        _name = NULLSTRING;
        _content = NULLSTRING;
        _isReply = NO;
    }
    return self;
}

@end
