//
//  WBHomeStatusesResult.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBHomeStatusesResult : NSObject

/*
 *微博数据
 */
@property (nonatomic, strong) NSArray *statuses;

@property (nonatomic, strong) NSNumber *previous_cursor;

@property (nonatomic, strong) NSNumber *next_cursor;

@property (nonatomic, strong) NSNumber *total_number;

@end
