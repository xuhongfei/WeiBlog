//
//  WBTabBar.m
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBTabBar.h"
#import "UIImage+WB.h"
#import "WBTabBarButton.h"
#import "WBCommon.h"

@interface WBTabBar ()

@property (nonatomic, weak) UIButton *selectedButton;
@property (nonatomic, weak) UIButton *composeButton;
@property (nonatomic, strong) NSMutableArray *tabBarButtons;

@end

@implementation WBTabBar

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        if (!ios7) {
            [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]]];
        }
        
        [self setupComposeButton];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGFloat h = height;
    CGFloat w = width / self.subviews.count;
    self.composeButton.bounds = CGRectMake(0, 0, w, h);
    self.composeButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    CGFloat buttonW = width / self.subviews.count;
    CGFloat buttonH = height;
    CGFloat buttonY = 0;
    for (int i = 0; i < self.tabBarButtons.count; i ++) {
        UIButton *button = self.tabBarButtons[i];
        button.tag = i;
        
        CGFloat buttonX = i * buttonW;
        if (i > 1) {
            buttonX += buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    
    return _tabBarButtons;
}


#pragma mark - 添加发布微博
- (void)setupComposeButton
{
    UIButton *composeButton = [[UIButton alloc] init];
    [composeButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [composeButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [composeButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [composeButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [composeButton addTarget:self action:@selector(composeStatus:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:composeButton];
    self.composeButton = composeButton;
}

#pragma mark - 添加TabBar按钮
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    WBTabBarButton *button = [[WBTabBarButton alloc] init];
    button.item = item;
    [self addSubview:button];
    [self.tabBarButtons addObject:button];
    
    [button addTarget:self action:@selector(didButtonClicked:) forControlEvents:UIControlEventTouchDown];
    
    if (self.tabBarButtons.count == 1) {
        [self didButtonClicked:button];
    }
}

#pragma mark - 处理事件

- (void)composeStatus:(UIButton *)composeButton
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidComposeButtonClicked:)]) {
        [self.delegate tabBarDidComposeButtonClicked:self];
    }
}

- (void)didButtonClicked:(WBTabBarButton *)button
{
    //按钮绑定Tag，以便在此使用
    if ([self.delegate respondsToSelector:@selector(tabBar:didButtonClickedFrom:to:)]) {
        [self.delegate tabBar:self didButtonClickedFrom:self.selectedButton.tag to:button.tag];
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

@end
