//
//  NSDate+WB.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/8.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "NSDate+WB.h"

@implementation NSDate (WB)

/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

/**
 *  是否为昨天
 */
- (BOOL)isYesterday
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *now = [NSDate date];
    NSString *nowStr = [fmt stringFromDate:now];
    NSDate *nowD = [fmt dateFromString:nowStr];
    
    NSString *selfStr = [fmt stringFromDate:self];
    NSDate *selfD = [fmt dateFromString:selfStr];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [cal components:NSCalendarUnitDay fromDate:selfD toDate:nowD options:0];
   
    return (cmps.day == 1);
}

/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}


@end
