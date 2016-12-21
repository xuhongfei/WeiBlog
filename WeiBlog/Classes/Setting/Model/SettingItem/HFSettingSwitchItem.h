//
//  HFSettingSwitchItem.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HFSettingItem.h"


@interface HFSettingSwitchItem : HFSettingItem

@property (nonatomic, assign, getter=isOn) BOOL on;
@property (nonatomic, assign, getter=isDefaultOn) BOOL defaultOn;

@end
