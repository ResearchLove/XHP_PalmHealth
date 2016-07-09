//
//  PersonalCenterModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/7/1.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalCenterModel : NSObject

@property (copy,nonatomic) NSString *imageURL;
@property (copy,nonatomic) NSString *title;


+(PersonalCenterModel *)createMenuIconPath:(NSString *)iconPath title:(NSString *)title;

@end
