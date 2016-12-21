//
//  WBNavigationController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/1.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBNavigationController.h"
#import "WBCommon.h"

@implementation WBNavigationController

+ (void)initialize
{
    [self setupNavigationBarTheme];
    [self setupNavigationBarItemTheme];
}


+ (void)setupNavigationBarItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    if (!ios7) {
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = ios7 ? [UIFont systemFontOfSize:14] : [UIFont systemFontOfSize:12];
    textAttrs[NSForegroundColorAttributeName] = ios7 ? [UIColor orangeColor] : [UIColor grayColor];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
}

+ (void)setupNavigationBarTheme
{
    UINavigationBar *navbar = [UINavigationBar appearance];
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    dictM[NSShadowAttributeName] = shadow;
    [navbar setTitleTextAttributes:dictM];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
