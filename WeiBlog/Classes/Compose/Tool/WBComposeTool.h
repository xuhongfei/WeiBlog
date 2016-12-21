//
//  WBComposeTool.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/15.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBComposeStatusParam.h"
#import "WBComposeStatusResult.h"

@interface WBComposeTool : NSObject


+ (void)composeStatusWithParam:(WBComposeStatusParam *)param success:(void (^)(WBComposeStatusResult *result))success failure:(void (^)(NSError *error))failure;

@end
