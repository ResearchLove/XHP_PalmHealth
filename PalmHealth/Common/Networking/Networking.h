//
//  Networking.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/26.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface Networking : NSObject

+ (NSURLSessionDataTask *)postUrl:(NSString *)urlString
                       parameters:(id)parameters
                          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
