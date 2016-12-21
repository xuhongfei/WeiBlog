//
//  WBAccountTool.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBAccount;

@interface WBAccountTool : NSObject

/*
 *存储账号
 */
+ (void)saveAccount:(WBAccount *)account;
/*
 *获得账号
 */
+ (WBAccount *)account;

@end
