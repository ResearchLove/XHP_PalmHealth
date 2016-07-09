//
//  PersonalInfomationModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/8.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalInfomationModel : NSObject

@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *contents;

+(PersonalInfomationModel *)createMenuTitle:(NSString *)title contents:(NSString *)contents;


@end
