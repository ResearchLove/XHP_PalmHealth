//
//  FormattingMyDoctorDataHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/24.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "FormattingMyDoctorDataHelper.h"
#import "MyDoctorModel.h"

@implementation FormattingMyDoctorDataHelper

+(NSMutableArray *)getMyDoctorListDataBy:(NSMutableArray *)array
{
    
    NSMutableArray *ans = [[NSMutableArray alloc] init];
    
    NSArray *serializeArray = [(NSArray *)array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {        // 排序
        int i;
        NSString *strA = ((MyDoctorModel *)obj1).pinyin;
        NSString *strB = ((MyDoctorModel *)obj2).pinyin;
        for (i = 0; i < strA.length && i < strB.length; i ++) {
            char a = [strA characterAtIndex:i];
            char b = [strB characterAtIndex:i];
            if (a > b) {
                return (NSComparisonResult)NSOrderedDescending;        // 上升
            }
            else if (a < b) {
                return (NSComparisonResult)NSOrderedAscending;         // 下降
            }
        }
        
        if (strA.length > strB.length) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        else if (strA.length < strB.length){
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    char lastC = '1';
    NSMutableArray *data;
    NSMutableArray *oth = [[NSMutableArray alloc] init];
    for (MyDoctorModel *myDoctorModel in serializeArray) {
        char c = [myDoctorModel.pinyin characterAtIndex:0];
        if (!isalpha(c)) {
            [oth addObject:myDoctorModel];
        }
        else if (c != lastC){
            lastC = c;
            if (data && data.count > 0) {
                [ans addObject:data];
            }
            
            data = [[NSMutableArray alloc] init];
            [data addObject:myDoctorModel];
        }
        else {
            [data addObject:myDoctorModel];
        }
    }
    if (data && data.count > 0) {
        [ans addObject:data];
    }
    if (oth.count > 0) {
        [ans addObject:oth];
    }
    
    return ans;
}

+ (NSMutableArray *)getMyDoctorListSectionBy:(NSMutableArray *)array
{
    NSMutableArray *sectionAry = [[NSMutableArray alloc]init];
    [sectionAry addObject:UITableViewIndexSearch];
    for (NSArray *item in array) {
         MyDoctorModel *myDoctorModel = [item objectAtIndex:0];
        char c = [myDoctorModel.pinyin characterAtIndex:0];
        if (!isalpha(c)) {
            c = '#';
        }
        [sectionAry addObject:[NSString stringWithFormat:@"%c", toupper(c)]];
    }
    return sectionAry;
}


@end
