//
//  WBStatusCacheTool.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/18.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBStatus, WBHomeStatusesParam;

@interface WBStatusCacheTool : NSObject

/**
 * 单个微博数据缓存到数据库
 */
+ (void)addStatus:(WBStatus *)status;

/**
 * 微博数组缓存到数据库
 */
+ (void)addStatuses:(NSArray *)statusArray;

/**
 * 获得一组缓存微博数据
 */
+ (NSArray *)statusesWithParam:(WBHomeStatusesParam *)param;

@end
