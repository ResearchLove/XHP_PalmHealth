//
//  FriendsModel.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/13.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NULLSTRING @""


@interface PersonModel : NSObject

@property (strong,nonatomic) NSString *backImage;
@property (strong,nonatomic) NSString *personName;
@property (strong,nonatomic) NSString *personIcon;

@end


@interface FriendsModel : NSObject

@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *userImage;
@property (copy,nonatomic) NSString *userName;
@property (copy,nonatomic) NSArray *imageAry;
@property (nonatomic,strong) NSMutableArray *answerAry;
@property (nonatomic,assign) BOOL isHidePraiseView;  //是否要隐藏赞背景视图

@end
