//
//  WBAuthorizeTool.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBHttpAuthorizeParam, WBAccount;

@interface WBAuthorizeTool : NSObject


+ (void)authorizeDataWithParam:(WBHttpAuthorizeParam *)param success:(void (^)(WBAccount *account))success failure:(void (^)(NSError *error))failure;


@end
