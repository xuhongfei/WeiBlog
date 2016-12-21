//
//  WBAuthorizeTool.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBAuthorizeTool.h"
#import "WBHttpTool.h"
#import "MJExtension.h"
#import "WBHttpAuthorizeParam.h"
#import "WBAccount.h"

@implementation WBAuthorizeTool

+ (void)authorizeDataWithParam:(WBHttpAuthorizeParam *)param success:(void (^)(WBAccount *))success failure:(void (^)(NSError *))failure
{
    NSString *urlStr = @"https://api.weibo.com/oauth2/access_token";
    
    [WBHttpTool postWithURLString:urlStr parameters:[param keyValues] success:^(id responseObject) {
        if (success) {
            WBAccount *account = [WBAccount accountWithDict:responseObject];
            success(account);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
            
        }
        
    }];
}

@end
