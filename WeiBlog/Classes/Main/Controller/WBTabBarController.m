//
//  WBTabBarController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBTabBarController.h"
#import "WBHomeController.h"
#import "WBMessageController.h"
#import "WBDiscoverController.h"
#import "WBMeController.h"
#import "WBNavigationController.h"
#import "UIImage+WB.h"
#import "WBTabBar.h"
#import "WBComposeController.h"
#import "WBUserUnreadCountTool.h"
#import "WBAccount.h"
#import "WBAccountTool.h"

@interface WBTabBarController () <WBTabBarDelegate>
@property (nonatomic, weak) WBTabBar *customTabBar;

@property (nonatomic, weak) WBHomeController *homeC;
@property (nonatomic, weak) WBMessageController *messageC;
@property (nonatomic, weak) WBDiscoverController *discoverC;
@property (nonatomic, weak) WBMeController *meC;
@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingTabBar];
    
    [self setupAllChildViewController];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(checkUnreadCount) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)checkUnreadCount
{
    WBAccount *account = [WBAccountTool account];
    WBUserUnreadCountParam *param = [[WBUserUnreadCountParam alloc] init];
    param.access_token = account.access_token;
    param.uid = @(account.uid);
    [WBUserUnreadCountTool userUnreadCountWithParam:param success:^(WBUserUnreadCountResult *result) {
        
        self.homeC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.status];
        self.messageC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.messageCount];
        self.meC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.follower];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.count;
        
    } failure:^(NSError *error) {
        
    }];
}

/*
 *  设置自定义TabBar
 */
- (void)settingTabBar
{
    WBTabBar *customTabBar = [[WBTabBar alloc] initWithFrame:self.tabBar.bounds];
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/*
 *  初始化所有子控制器
 */
- (void)setupAllChildViewController
{
    WBHomeController *home = [[WBHomeController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    self.homeC = home;
    
    WBMessageController *message = [[WBMessageController alloc] init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    self.messageC = message;
    
    WBDiscoverController *discover = [[WBDiscoverController alloc] init];
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    self.discoverC = discover;
    
    WBMeController *me = [[WBMeController alloc] init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    self.meC = me;
}

/*
 *  初始化一个子控制器
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置子控制器属性
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    childVc.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 将自控制器添加到导航控制器中
    WBNavigationController *nav = [[WBNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    self.customTabBar.delegate = self;
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

#pragma mark - TabBar Delegate Function
- (void)tabBar:(WBTabBar *)tabBar didButtonClickedFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
    
    if (to == 0) {
        [self.homeC refresh];
    }
}

- (void)tabBarDidComposeButtonClicked:(WBTabBar *)tabBar
{
    WBComposeController *composeVc = [[WBComposeController alloc] init];
    WBNavigationController *nav = [[WBNavigationController alloc] initWithRootViewController:composeVc];
    
    [self presentViewController:nav animated:YES completion:nil];
}
@end
