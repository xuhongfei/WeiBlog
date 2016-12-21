//
//  WBComposeTool.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/15.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBComposeTool.h"
#import "WBHttpTool.h"
#import "MJExtension.h"

@implementation WBComposeTool

+ (void)composeStatusWithParam:(WBComposeStatusParam *)param success:(void (^)(WBComposeStatusResult *))success failure:(void (^)(NSError *))failure
{
    NSString *urlStr = @"https://api.weibo.com/2/statuses/update.json";
    [WBHttpTool postWithURLString:urlStr parameters:param.keyValues success:^(id responseObject) {
        if (success) {
            WBComposeStatusResult *result = [WBComposeStatusResult objectWithKeyValues:responseObject];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
