//
//  HFSettingArrowItem.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import "HFSettingArrowItem.h"

@implementation HFSettingArrowItem

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destVc:(Class)destVc
{
    HFSettingArrowItem *item = [HFSettingArrowItem item];
    item.title = title;
    item.icon = icon;
    if (destVc) {
        item.destVc = destVc;
    }

    
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVc:(Class)destVc
{
    return [self itemWithTitle:title icon:nil destVc:destVc];
}

@end
