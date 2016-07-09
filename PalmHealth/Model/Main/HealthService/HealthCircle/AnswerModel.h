//
//  AnswerModel.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/13.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NULLSTRING @""

@interface AnswerModel : NSObject

@property (copy,nonatomic) NSString *name;    //回复人
@property (copy,nonatomic) NSString *content; //<<<评论的内容
@property (assign,nonatomic) BOOL isReply;    //<<<是否是回复别人评论

@end
