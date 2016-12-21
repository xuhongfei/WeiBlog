//
//  WBAccount.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/5.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBAccount : NSObject <NSCoding>

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, assign) long long expires_in;
@property (nonatomic, assign) long long remind_in;
@property (nonatomic, assign) long long uid;
@property (nonatomic, strong) NSDate *expiresTime;
@property (nonatomic, copy) NSString *name;

+ (instancetype)accountWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
