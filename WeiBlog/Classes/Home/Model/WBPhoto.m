//
//  WBPhoto.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/8.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBPhoto.h"
#import "MJExtension.h"

@implementation WBPhoto

+ (instancetype)photoWithDict:(NSDictionary *)dict
{
    return [[WBPhoto alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

MJCodingImplementation

@end
