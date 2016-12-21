//
//  HFSettingGroup.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFSettingGroup : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;

@property (nonatomic, strong) NSArray *items;

+ (instancetype)group;

@end
