//
//  WBHttpTool.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBHttpTool : NSObject



+ (void)postWithURLString:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)getWithURLString:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
