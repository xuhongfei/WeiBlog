//
//  WBTabBar.h
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBTabBar;

@protocol WBTabBarDelegate <NSObject>

@optional
- (void)tabBar:(WBTabBar *)tabBar didButtonClickedFrom:(NSInteger)from to:(NSInteger)to;
- (void)tabBarDidComposeButtonClicked:(WBTabBar *)tabBar;

@end

@interface WBTabBar : UIView

@property (nonatomic, weak) id<WBTabBarDelegate> delegate;

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
