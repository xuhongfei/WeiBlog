//
//  WBStatusTool.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBHomeStatusesParam.h"
#import "WBHomeStatusesResult.h"

@interface WBStatusTool : NSObject

+ (void)statusesWithParam:(WBHomeStatusesParam *)param success:(void (^)(WBHomeStatusesResult *result))success failure:(void (^)(NSError *error))failure;

@end
