//
//  WBUserUnreadCountTool.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/16.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBUserUnreadCountTool.h"
#import "WBHttpTool.h"
#import "MJExtension.h"

@implementation WBUserUnreadCountTool

+ (void)userUnreadCountWithParam:(WBUserUnreadCountParam *)param success:(void (^)(WBUserUnreadCountResult *))success failure:(void (^)(NSError *))failure
{
    
    [WBHttpTool getWithURLString:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:param.keyValues success:^(id responseObject) {
        if (success) {
            WBUserUnreadCountResult *result = [WBUserUnreadCountResult objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
