//
//  WBAccount.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/5.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBAccount.h"

@implementation WBAccount

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    return [[WBAccount alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.access_token = [decoder decodeObjectForKey:@"access_token"];
        self.expiresTime = [decoder decodeObjectForKey:@"expiresTime"];
        self.expires_in = [decoder decodeInt64ForKey:@"expires_in"];
        self.remind_in = [decoder decodeInt64ForKey:@"remind_in"];
        self.uid = [decoder decodeInt64ForKey:@"uid"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.access_token forKey:@"access_token"];
    [encoder encodeObject:self.expiresTime forKey:@"expiresTime"];
    [encoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [encoder encodeInt64:self.remind_in forKey:@"remind_in"];
    [encoder encodeInt64:self.uid forKey:@"uid"];
    [encoder encodeObject:self.name forKey:@"name"];
}

@end
