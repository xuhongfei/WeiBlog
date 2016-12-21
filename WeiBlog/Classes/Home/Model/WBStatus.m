//
//  WBStatus.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/5.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBStatus.h"
#import "WBUser.h"
#import "NSDate+WB.h"
#import "WBPhoto.h"
#import "MJExtension.h"

@implementation WBStatus

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[WBStatus alloc] initWithDict:dict];
}


- (NSDictionary *)objectClassInArray
{
    return @{@"pic_urls" : [WBPhoto class]};
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.idstr = dict[@"idstr"];
        self.text = dict[@"text"];
        
        NSArray *array = dict[@"pic_urls"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            WBPhoto *photo = [WBPhoto photoWithDict:dict];
            [arrayM addObject:photo];
        }
        self.pic_urls = arrayM;
        
        self.created_at = dict[@"created_at"];
        self.source = dict[@"source"];
        self.comments_count = [dict[@"comments_count"] intValue];
        self.reposts_count = [dict[@"reposts_count"] intValue];
        self.attitudes_count = [dict[@"attitudes_count"] intValue];
        self.user = [WBUser userWithDict:dict[@"user"]];
        
        NSDictionary *retweetedStatusDict = dict[@"retweeted_status"];
        if (retweetedStatusDict != nil) {
            self.retweeted_status = [WBStatus statusWithDict:retweetedStatusDict];
        }
        
    }
    
    return self;
}

- (void)setSource:(NSString *)source
{
    long bigloc = [source rangeOfString:@">"].location;
    if (bigloc == NSNotFound) {
        
        _source = source;
        
    } else {
        if (source.length > 0) {
            long loc = [source rangeOfString:@">"].location + 1;
            long length = [source rangeOfString:@"</"].location - loc;
            source = [source substringWithRange:NSMakeRange(loc, length)];
            
            _source = [NSString stringWithFormat:@"来自%@", source];
        }
    }
    
    
}

- (NSString *)createdTime
{
    // _created_at == Fri May 09 16:30:34 +0800 2014
    // 1.获得微博的发送时间
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate *createdDate = [fmt dateFromString:_created_at];
    
    // 2..判断微博发送时间 和 现在时间 的差距
    if (createdDate.isToday) { // 今天
        if (createdDate.deltaWithNow.hour >= 1) {
            return [NSString stringWithFormat:@"%ld小时前", (long)createdDate.deltaWithNow.hour];
        } else if (createdDate.deltaWithNow.minute >= 1) {
            return [NSString stringWithFormat:@"%ld分钟前", (long)createdDate.deltaWithNow.minute];
        } else {
            return @"刚刚";
        }
    } else if (createdDate.isYesterday) { // 昨天
        fmt.dateFormat = @"昨天 HH:mm";
        return [fmt stringFromDate:createdDate];
    } else if (createdDate.isThisYear) { // 今年(至少是前天)
        fmt.dateFormat = @"MM-dd HH:mm";
        return [fmt stringFromDate:createdDate];
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:createdDate];
    }
    
}

MJCodingImplementation

@end

/*
 NSDate -- 表示一个绝对的时间点
 NSTimeZone -- 时区信息
 NSLocale -- 本地化信息
 NSDateComponents -- 一个封装了具体年月日、时秒分、周、季度等的类
 NSCalendar -- 日历类，它提供了大部分的日期计算接口，并且允许您在NSDate和NSDateComponents之间转换
 NSDateFormatter -- 用来在日期和字符串之间转换
 */

