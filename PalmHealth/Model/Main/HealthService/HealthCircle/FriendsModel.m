//
//  FriendsModel.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/13.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "FriendsModel.h"

@implementation PersonModel

-(instancetype)init
{
    self = [super init];
    if (self) {
        _backImage = NULLSTRING;
        _personName = NULLSTRING;
        _personIcon = NULLSTRING;
    }
    return self;
}

@end


@implementation FriendsModel

-(instancetype)init
{
    self = [super init];
    if (self) {
        _content = NULLSTRING;
        _userImage = NULLSTRING;
        _userName = NULLSTRING;
        _imageAry = [NSArray array];
        _answerAry = [NSMutableArray array];
        _isHidePraiseView = NO;;
        
    }
    return self;
}

@end
