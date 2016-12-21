//
//  HFSettingItem.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import "HFSettingItem.h"

@implementation HFSettingItem

+ (instancetype)item
{
    return [[self alloc] init];
}

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon
{
    HFSettingItem *item = [self item];
    item.title = title;
    item.icon = icon;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithTitle:title icon:nil];
}


@end
