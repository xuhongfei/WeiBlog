//
//  WBTool.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/5.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBTool.h"
#import "WBTabBarController.h"
#import "WBNewfeatureViewController.h"

@implementation WBTool

+ (void)chooseRootConroller
{
    if ([self isNewVersion]) {
        [[UIApplication sharedApplication].keyWindow setRootViewController:[[WBNewfeatureViewController alloc] init]];
    } else {
        [[UIApplication sharedApplication].keyWindow setRootViewController:[[WBTabBarController alloc] init]];
    }
}

+ (BOOL)isNewVersion
{
    NSString *key = @"CFBundleVersion";
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [userDefaults stringForKey:key];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    if ([currentVersion isEqualToString:lastVersion]) {
        return NO;
    }
    [userDefaults setObject:currentVersion forKey:key];
    return YES;
}


@end
