//
//  UIBarButtonItem+WB.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/3.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WB)


/*
 *  创建导航栏控件
 */
+ (UIBarButtonItem *)setupNavigationBarButtonItemWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action;

@end
