//
//  HealthServiceModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthServiceModel : NSObject

@property (copy,nonatomic) NSString *iconPath;
@property (copy,nonatomic) NSString *title;

+(HealthServiceModel *)createMenuIconPath:(NSString *)iconPath title:(NSString *)title;

@end
