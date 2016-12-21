//
//  WBUserTool.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBUserInfoParam.h"
#import "WBUserInfoResult.h"

@interface WBUserTool : NSObject


+ (void)userInfoWith:(WBUserInfoParam *)param success:(void (^)(WBUserInfoResult *result))success failure:(void (^)(NSError *error))failure;

@end
