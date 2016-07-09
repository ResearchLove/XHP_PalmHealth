//
//  WelfareModel.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/27.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WelfareModel : NSObject

@property (copy,nonatomic) NSString *iconPath;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *detailsURL;

+(WelfareModel *)createItemIconPath:(NSString *)iconPath title:(NSString *)title detailsURL:(NSString *)detailsURL;

@end
