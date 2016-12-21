//
//  WBStatusesTool.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBStatusTool.h"
#import "WBHttpTool.h"
#import "MJExtension.h"
#import "WBStatusCacheTool.h"

@implementation WBStatusTool


+ (void)statusesWithParam:(WBHomeStatusesParam *)param success:(void (^)(WBHomeStatusesResult *))success failure:(void (^)(NSError *))failure
{
    NSArray *statusArray = [WBStatusCacheTool statusesWithParam:param];
    if (statusArray.count) {
        if (success) {
            WBHomeStatusesResult *result = [[WBHomeStatusesResult alloc] init];
            result.statuses = statusArray;
            success(result);
        }
        
    } else {
        [WBHttpTool getWithURLString:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:param.keyValues success:^(id responseObject) {
            
            WBHomeStatusesResult *result = [WBHomeStatusesResult objectWithKeyValues:responseObject];
            
            [WBStatusCacheTool addStatuses:result.statuses];
            
            if (success) {
                
                success(result);
            }
        } failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
    }
}

@end
