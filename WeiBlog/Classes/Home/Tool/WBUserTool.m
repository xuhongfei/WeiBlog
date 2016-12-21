//
//  WBUserTool.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBUserTool.h"
#import "WBHttpTool.h"
#import "MJExtension.h"

@implementation WBUserTool

+ (void)userInfoWith:(WBUserInfoParam *)param success:(void (^)(WBUserInfoResult *))success failure:(void (^)(NSError *))failure
{
    [WBHttpTool getWithURLString:@"https://api.weibo.com/2/users/show.json" parameters:param.keyValues success:^(id responseObject) {
        if (success) {
            WBUserInfoResult *result = [WBUserInfoResult objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
