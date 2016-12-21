//
//  HFSystemSettingViewController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/22.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import "HFSystemSettingViewController.h"
#import "HFSettingGroup.h"
#import "HFSettingItem.h"
#import "HFSettingSwitchItem.h"
#import "HFSettingArrowItem.h"

@implementation HFSystemSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    
    
}

- (void)setupGroup0
{
    HFSettingGroup *group = [self addGroup];
    
    HFSettingArrowItem *account = [HFSettingArrowItem itemWithTitle:@"帐号管理"];
    group.items = @[account];
}

- (void)setupGroup1
{
    HFSettingGroup *group = [self addGroup];
    
    HFSettingArrowItem *theme = [HFSettingArrowItem itemWithTitle:@"主题、背景" destVc:nil];//[IWThemeBgViewController class]];
    group.items = @[theme];
}

- (void)setupGroup2
{
    HFSettingGroup *group = [self addGroup];
    
    HFSettingArrowItem *notice = [HFSettingArrowItem itemWithTitle:@"通知和提醒"];
    HFSettingArrowItem *general = [HFSettingArrowItem itemWithTitle:@"通用设置" destVc:nil];//[IWGeneralViewController class]];
    HFSettingArrowItem *safe = [HFSettingArrowItem itemWithTitle:@"隐私与安全"];
    group.items = @[notice, general, safe];
}

- (void)setupGroup3
{
    HFSettingGroup *group = [self addGroup];
    
    HFSettingArrowItem *opinion = [HFSettingArrowItem itemWithTitle:@"意见反馈"];
    HFSettingArrowItem *about = [HFSettingArrowItem itemWithTitle:@"关于微博"];
    group.items = @[opinion, about];
}

@end
