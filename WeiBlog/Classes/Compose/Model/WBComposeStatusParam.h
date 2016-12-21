//
//  WBComposeStatusParam.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/15.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBComposeStatusParam : NSObject

/*
 *采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得
 */
@property (nonatomic, copy) NSString *access_token;

/*
 *要发布的微博文本内容，必须做URLencode，内容不超过140个汉字
 */
@property (nonatomic, copy) NSString *status;

@end