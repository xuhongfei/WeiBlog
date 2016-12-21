//
//  HFSettingViewController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import "HFSettingViewController.h"
#import "HFSettingGroup.h"
#import "HFSettingItem.h"
#import "HFSettingCell.h"
#import "WBCommon.h"

@interface HFSettingViewController()

@end


@implementation HFSettingViewController


#pragma mark - Init
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundView = nil;
    self.view.backgroundColor = Color(232, 233, 232);
    
    self.tableView.sectionHeaderHeight = 0;      //每一组头部高度
    self.tableView.sectionFooterHeight = 10;     //每一组尾部高度
    
    UIView *footer = [[UIView alloc]init];
    footer.frame = CGRectMake(0, 0, 0, 1);
    self.tableView.tableFooterView = footer;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-28, 0, 0, 0);
}

- (NSArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    
    return _groups;
}

- (HFSettingGroup *)addGroup
{
    HFSettingGroup *group = [HFSettingGroup group];
    [self.groups addObject:group];
    return group;
}

#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HFSettingGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HFSettingCell *cell = [HFSettingCell cellWithTableView:tableView];
    
    HFSettingGroup *group = self.groups[indexPath.section];
    HFSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    HFSettingGroup *group = self.groups[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    HFSettingGroup *group = self.groups[section];
    return group.footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
