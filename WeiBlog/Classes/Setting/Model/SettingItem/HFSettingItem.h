//
//  HFSettingItem.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^HFSettingItemOperation)();

@interface HFSettingItem : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *badgeValue;
@property (nonatomic, copy) HFSettingItemOperation operation;

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)item;

@end
