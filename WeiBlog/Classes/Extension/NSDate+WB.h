//
//  NSDate+WB.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/8.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WB)

- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isThisYear;

- (NSDateComponents *)deltaWithNow;

@end
