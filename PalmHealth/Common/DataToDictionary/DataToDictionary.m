//
//  DataToDictionary.m
//  XHMovie
//
//  Created by apple on 15/7/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DataToDictionary.h"
static NSDictionary *resultDict = nil;
@implementation DataToDictionary
+(NSDictionary *)dataToDict:(id)sender
{
    if ([sender isKindOfClass:[NSDictionary class]]) {
        resultDict = sender;
    }else{
        resultDict = [NSJSONSerialization JSONObjectWithData:sender options:NSJSONReadingMutableLeaves error:nil];
    }
    return resultDict;
}
+(void)releaseDict
{
    resultDict = nil;

}

@end
