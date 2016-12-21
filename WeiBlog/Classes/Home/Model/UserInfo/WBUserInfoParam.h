//
//  WBUserInfoParam.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUserInfoParam : NSObject

/*
 *采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得
 */
@property (nonatomic, copy) NSString *access_token;

/*
 *需要查询的用户ID
 */
@property (nonatomic, assign) long long uid;

+ (instancetype)param;

@end
