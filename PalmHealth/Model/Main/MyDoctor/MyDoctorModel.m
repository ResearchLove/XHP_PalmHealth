//
//  MyDoctorModel.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/21.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "MyDoctorModel.h"
#import "NSString+PinYin.h"

@implementation MyDoctorModel

-(void)setUserName:(NSString *)userName
{
    _userName = userName;
    _pinyin = userName.pinyin;
    _pinyin = userName.pinyinInitial;
}

@end
