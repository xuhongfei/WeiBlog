//
//  WBUserUnreadCountTool.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/16.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBUserUnreadCountParam.h"
#import "WBUserUnreadCountResult.h"

@interface WBUserUnreadCountTool : NSObject

+ (void)userUnreadCountWithParam:(WBUserUnreadCountParam *)param success:(void (^)(WBUserUnreadCountResult *result))success failure:(void (^)(NSError *error))failure;

@end
