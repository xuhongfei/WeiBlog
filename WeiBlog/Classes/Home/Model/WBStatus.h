//
//  WBStatus.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/5.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WBUser;

@interface WBStatus : NSObject

/** 微博UID */
@property (nonatomic, copy) NSString *idstr;
/** 微博信息内容 */
@property (nonatomic, copy) NSString *text;
/** 微博的图片*/
//@property (nonatomic, copy) NSString *pic;
@property (nonatomic, strong) NSArray *pic_urls;

/** 微博创建时间 */
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy, readonly) NSString *createdTime;

/** 微博来源 */
@property (nonatomic, copy) NSString *source;
/** 微博转发数 */
@property (nonatomic, assign) int reposts_count;
/** 微博评论数 */
@property (nonatomic, assign) int comments_count;
/** 微博表态数 */
@property (nonatomic, assign) int attitudes_count;
/** 微博作者用户 */
@property (nonatomic, strong) WBUser *user;
/** 转发的微博*/
@property (nonatomic, strong) WBStatus *retweeted_status;

+ (instancetype)statusWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
