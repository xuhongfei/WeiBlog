//
//  WBAccountTool.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBAccount.h"


#define WBAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]


@implementation WBAccountTool

+ (void)saveAccount:(WBAccount *)account
{
    NSDate *now = [NSDate date];
    account.expiresTime = [now dateByAddingTimeInterval:account.expires_in];
    [NSKeyedArchiver archiveRootObject:account toFile:WBAccountFile];
}

+ (WBAccount *)account
{
    NSDate *now = [NSDate date];
    WBAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:WBAccountFile];
    if ([now compare:account.expiresTime] == NSOrderedAscending) {
        return account;
    }
    return nil;
}


@end
