//
//  WBMeController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBMeController.h"
#import "WBSearchBar.h"
#import "HFSettingGroup.h"
#import "HFSettingItem.h"
#import "HFSettingSwitchItem.h"
#import "HFSettingArrowItem.h"
#import "WBNavigationController.h"
#import "HFSystemSettingViewController.h"

@interface WBMeController ()

@end

@implementation WBMeController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    
    //添加数据
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
}



- (void)setupGroup0
{
    HFSettingGroup *group = [self addGroup];
    HFSettingArrowItem *newFriend = [HFSettingArrowItem itemWithTitle:@"新的好友" icon:@"new_friend" destVc:nil];
    newFriend.badgeValue = @"4";
    group.items = @[newFriend];
//    [self.groups addObject:group];
}

- (void)setupGroup1
{
    HFSettingGroup *group = [self addGroup];
    
    HFSettingArrowItem *album = [HFSettingArrowItem itemWithTitle:@"我的相册" icon:@"album" destVc:nil];
    album.subtitle = @"(109)";
    HFSettingArrowItem *collect = [HFSettingArrowItem itemWithTitle:@"我的收藏" icon:@"collect" destVc:nil];
    collect.subtitle = @"(0)";
    HFSettingArrowItem *like = [HFSettingArrowItem itemWithTitle:@"赞" icon:@"like" destVc:nil];
    like.badgeValue = @"1";
    like.subtitle = @"(35)";
    group.items = @[album, collect, like];
}

- (void)setupGroup2
{
    HFSettingGroup *group = [self addGroup];
    
    HFSettingArrowItem *pay = [HFSettingArrowItem itemWithTitle:@"微博支付" icon:@"pay" destVc:nil];
    HFSettingArrowItem *vip = [HFSettingArrowItem itemWithTitle:@"会员中心" icon:@"vip" destVc:nil];
    group.items = @[pay, vip];
}

- (void)setupGroup3
{
    HFSettingGroup *group = [self addGroup];
    
    HFSettingArrowItem *card = [HFSettingArrowItem itemWithTitle:@"我的名片" icon:@"card" destVc:nil];
    HFSettingArrowItem *draft = [HFSettingArrowItem itemWithTitle:@"草稿箱" icon:@"draft" destVc:nil];
    group.items = @[card, draft];
}


- (void)setting
{
    HFSystemSettingViewController *sysSetting = [[HFSystemSettingViewController alloc] init];
    [self.navigationController pushViewController:sysSetting animated:YES];
}



@end
