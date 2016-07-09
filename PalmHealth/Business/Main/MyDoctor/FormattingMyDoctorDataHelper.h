//
//  FormattingMyDoctorDataHelper.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/24.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FormattingMyDoctorDataHelper : NSObject

/**
 *  格式化好友列表
 */
+ (NSMutableArray *) getMyDoctorListDataBy:(NSMutableArray *)array;
+ (NSMutableArray *) getMyDoctorListSectionBy:(NSMutableArray *)array;

@end
