//
//  WBHomeController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBHomeController.h"
#import "WBBadgeButton.h"
#import "WBCommon.h"
#import "UIBarButtonItem+WB.h"
#import "WBTitleButton.h"
#import "WBAccount.h"
#import "WBTool.h"
#import "WBAccountTool.h"
#import "WBStatus.h"
#import "WBUser.h"
#import "UIImageView+WebCache.h"
#import "WBStatusCell.h"
#import "WBStatusFrame.h"
#import "MJRefresh.h"
#import "UIImage+WB.h"

#import "WBUserTool.h"
#import "WBStatusTool.h"

#define WBHomeControllerTitleButtonUp 0
#define WBHomeControllerTitleButtonDown -1

@interface WBHomeController ()

@property (nonatomic, strong) NSArray *statusFrames;

@end

@implementation WBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self setupBarButton];
    
    [self setupTitleView];
    
    [self setupRefreshView];
    
    [self setupUserData];
}

#pragma mark - 创建用户数据
- (void)setupUserData
{
    WBAccount *account = [WBAccountTool account];
    WBUserInfoParam *param = [WBUserInfoParam param];
    param.access_token = account.access_token;
    param.uid = account.uid;
    
    [WBUserTool userInfoWith:param success:^(WBUserInfoResult *result) {
        
        account.name = result.name;
        [WBAccountTool saveAccount:account];

        WBTitleButton *titleButton = (WBTitleButton *)self.navigationItem.titleView;
        [titleButton setTitle:account.name forState:UIControlStateNormal];
        
    } failure:^(NSError *error) {
        
    }];

}

#pragma mark - 刷新数据
- (void)setupRefreshView
{
    [self.tableView addHeaderWithTarget:self action:@selector(headerRefresh)];
    [self.tableView addFooterWithTarget:self action:@selector(footerRefresh)];
    
    //一开始进来加载数据
    [self.tableView headerBeginRefreshing];
}

- (void)headerRefresh
{
    WBAccount *account = [WBAccountTool account];
    WBHomeStatusesParam *param = [WBHomeStatusesParam param];
    param.access_token = account.access_token;
    param.count = @(20);
    if (self.statusFrames.count) {
        WBStatusFrame *firstStatusFrame = [self.statusFrames firstObject];
        param.since_id = @([firstStatusFrame.status.idstr longLongValue]);
    }
    
    [WBStatusTool statusesWithParam:param success:^(WBHomeStatusesResult *result) {
        NSMutableArray *arrayM = [NSMutableArray array];
        for (WBStatus *status in result.statuses) {
            WBStatusFrame *statusFrame = [[WBStatusFrame alloc] init];
            statusFrame.status = status;
            [arrayM addObject:statusFrame];
        }

        NSMutableArray *newArray = [NSMutableArray array];
        [newArray addObjectsFromArray:arrayM];
        [newArray addObjectsFromArray:self.statusFrames];

        self.statusFrames = newArray;

        [self.tableView reloadData];
        [self setupRemindView:arrayM.count];

    } failure:^(NSError *error) {
        
    }];
    
    [self.tableView headerEndRefreshing];
}

- (void)refresh
{
    if ([self.tabBarItem.badgeValue intValue] > 0) {
        [self headerRefresh];
    }
}

//初始化提醒视图
- (void)setupRemindView:(NSInteger)count
{
    UIButton *remindBtn = [[UIButton alloc] init];
    [self.navigationController.view insertSubview:remindBtn belowSubview:self.navigationController.navigationBar];
    remindBtn.userInteractionEnabled = NO;
    [remindBtn setBackgroundImage:[UIImage resizableImageWithImageName:@"timeline_new_status_background"] forState:UIControlStateNormal];
    [remindBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    remindBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    NSString *title = (count > 0) ? [NSString stringWithFormat:@"%ld条新微博", (long)count] : @"没有更新的微博";
    
    [remindBtn setTitle:title forState:UIControlStateNormal];
    CGFloat remindX = 0;
    CGFloat remindY = 20;
    CGFloat remindW = self.navigationController.view.frame.size.width;
    CGFloat remindH = 44;
    remindBtn.frame = CGRectMake(remindX, remindY, remindW, remindH);
    
    [UIView animateWithDuration:0.5 animations:^{
        remindBtn.transform = CGAffineTransformMakeTranslation(0, 44);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:0.5 delay:1.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            remindBtn.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [remindBtn removeFromSuperview];
        }];
    }];
}

- (void)footerRefresh
{
    WBAccount *account = [WBAccountTool account];
    WBHomeStatusesParam *param = [WBHomeStatusesParam param];
    param.access_token = account.access_token;
    param.count = @(10);
    if (self.statusFrames.count) {
        WBStatusFrame *lastStatusFrame = [self.statusFrames lastObject];
        param.max_id = @([lastStatusFrame.status.idstr longLongValue] - 1);
    }
    
    [WBStatusTool statusesWithParam:param success:^(WBHomeStatusesResult *result) {
        NSMutableArray *arrayM = [NSMutableArray array];
        for (WBStatus *status in result.statuses) {
            WBStatusFrame *statusFrame = [[WBStatusFrame alloc] init];
            statusFrame.status = status;
            [arrayM addObject:statusFrame];
        }
        
        NSMutableArray *newArray = [NSMutableArray array];
        [newArray addObjectsFromArray:self.statusFrames];
        [newArray addObjectsFromArray:arrayM];
        
        self.statusFrames = newArray;
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
    [self.tableView footerEndRefreshing];
}

#pragma mark - 初始化导航栏
- (void)setupTitleView
{
    WBTitleButton *titleButton = [[WBTitleButton alloc] init];
    self.navigationItem.titleView = titleButton;
    [titleButton setTitle:@"哈哈" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    titleButton.tag = WBHomeControllerTitleButtonUp;
    [titleButton addTarget:self action:@selector(didTitleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupBarButton
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setupNavigationBarButtonItemWithImageName:@"navigationbar_friendsearch" selectedImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem setupNavigationBarButtonItemWithImageName:@"navigationbar_pop" selectedImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
}

#pragma mark - 触发事件
- (void)friendSearch
{
    self.tabBarItem.badgeValue = @"100";
}

- (void)pop
{
    NSLog(@"pop");
}

- (void)didTitleButtonClicked:(UIButton *)button
{
    if (button.tag == WBHomeControllerTitleButtonUp) {
        [button setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        button.tag = WBHomeControllerTitleButtonDown;
    } else if (button.tag == WBHomeControllerTitleButtonDown){
        [button setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        button.tag = WBHomeControllerTitleButtonUp;
    }
}

# pragma mark - TableView代理方法
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBStatusCell *cell = [WBStatusCell cellWithTableView:tableView];
    
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}

@end
