//
//  WBUser.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/5.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUser : NSObject
/** 用户UID */
@property (nonatomic, copy) NSString *idstr;
/** 好友显示名称 */
@property (nonatomic, copy) NSString *name;
/** 用户头像地址 */
@property (nonatomic, copy) NSString *profile_image_url;

/** 会员等级 */
@property (nonatomic, assign) int mbrank;
/** 会员类型 */
@property (nonatomic, assign) int mbtype;

+ (instancetype)userWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end