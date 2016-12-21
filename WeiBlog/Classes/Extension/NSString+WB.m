//
//  NSString+WB.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/6.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "NSString+WB.h"

@implementation NSString (WB)

- (CGSize)sizeWithAttributesOnFont:(UIFont *)font
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    return [self sizeWithAttributes:attrs];
}

- (CGSize)sizeWithAttributesOnFont:(UIFont *)font size:(CGSize)size
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
