//
//  WBHomeStatusesResult.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBHomeStatusesResult.h"
#import "WBStatus.h"

@implementation WBHomeStatusesResult

- (NSDictionary *)objectClassInArray
{
    return @{@"statuses" : [WBStatus class]};
}

@end
