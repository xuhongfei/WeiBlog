//
//  WBUser.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/5.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBUser.h"
#import "MJExtension.h"

@implementation WBUser

+ (instancetype)userWithDict:(NSDictionary *)dict
{
    return [[WBUser alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.idstr = dict[@"idstr"];
        self.name = dict[@"name"];
        self.profile_image_url = dict[@"profile_image_url"];
        self.mbrank = [dict[@"mbrank"] intValue];
        self.mbtype = [dict[@"mbtype"] intValue];
    }
    
    return self;
}

MJCodingImplementation

@end
