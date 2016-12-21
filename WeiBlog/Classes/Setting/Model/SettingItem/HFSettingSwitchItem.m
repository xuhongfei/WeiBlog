//
//  HFSettingSwitchItem.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import "HFSettingSwitchItem.h"
#import "WBCommon.h"

@implementation HFSettingSwitchItem

- (instancetype)init
{
    if (self = [super init]) {
        self.defaultOn = YES;
    }
    
    return self;
}

- (void)setOn:(BOOL)on
{
    [UserDefaults setBool:on forKey:self.title];
    [UserDefaults synchronize];
}

- (BOOL)isOn
{
    id value = [UserDefaults objectForKey:self.title];
    if (value == nil) {
        return self.defaultOn;
    }
    return [value boolValue];
}

@end
