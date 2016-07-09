//
//  MyDoctorModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/21.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDoctorModel : NSObject

@property (assign,nonatomic) NSInteger userId;
@property (copy,nonatomic) NSString *avatarURL;
@property (copy,nonatomic) NSString *userName;
@property (copy,nonatomic) NSString *departmentName;
@property (copy,nonatomic) NSString *hospitalName;
@property (copy,nonatomic) NSString *doctorLevel;
@property (copy,nonatomic) NSString *userIntroduce;
@property (copy,nonatomic) NSString *visitInformationURL; //出诊信息
@property (copy,nonatomic) NSString *appointmentURL;      //<<<预约
@property (assign,nonatomic) NSInteger isFollow;            //<<<是否关注

@property (nonatomic,strong) NSString *pinyin;
@property (nonatomic,strong) NSString *initial;

@end
