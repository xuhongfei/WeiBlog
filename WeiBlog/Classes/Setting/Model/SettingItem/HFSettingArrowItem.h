//
//  HFSettingArrowItem.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HFSettingItem.h"

@interface HFSettingArrowItem : HFSettingItem

@property (nonatomic, assign) Class destVc;


+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destVc:(Class)destVc;
+ (instancetype)itemWithTitle:(NSString *)title destVc:(Class)destVc;;

@end
