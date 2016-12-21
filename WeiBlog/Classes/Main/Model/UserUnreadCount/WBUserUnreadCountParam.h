//
//  WBUserUnreadCountParam.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/16.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUserUnreadCountParam : NSObject


/*
 *采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得
 */
@property (nonatomic, copy) NSString *access_token;

/*
 *需要获取消息未读数的用户UID，必须是当前登录用户
 */
@property (nonatomic, strong) NSNumber *uid;



@end
