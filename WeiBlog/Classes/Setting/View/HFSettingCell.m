//
//  HFSettingCell.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import "HFSettingCell.h"
#import "HFSettingItem.h"
#import "HFSettingSwitchItem.h"
#import "HFSettingArrowItem.h"
#import "NSString+WB.h"
#import "WBBadgeButton.h"
#import "UIImage+WB.h"

@interface HFSettingCell ()

/**
 * 子标题
 */
@property (nonatomic, weak) UILabel *subtitleLabel;
/**
 *  箭头
 */
@property (strong, nonatomic) UIImageView *arrowView;
/**
 *  开关
 */
@property (strong, nonatomic) UISwitch *switchView;
/**
 *  提醒数字
 */
@property (strong, nonatomic) WBBadgeButton *badgeButton;

@end

@implementation HFSettingCell

#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"item";
    HFSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HFSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //设置标题
        self.textLabel.font = [UIFont systemFontOfSize:15];
        
        
        //添加子标题
        UILabel *subtitleLabel = [[UILabel alloc] init];
        subtitleLabel.font = [UIFont systemFontOfSize:13];
        subtitleLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:subtitleLabel];
        self.subtitleLabel = subtitleLabel;
    }
    
    return self;
}

- (WBBadgeButton *)badgeButton
{
    if (_badgeButton == nil) {
        _badgeButton = [[WBBadgeButton alloc] init];
    }
    return _badgeButton;
}

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"common_icon_arrow"]];
    }
    return _arrowView;
}


- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

- (void)switchChange
{
    HFSettingSwitchItem *item = (HFSettingSwitchItem *)self.item;
    item.on = self.switchView.isOn;
}

- (void)setItem:(HFSettingItem *)item
{
    _item = item;
    
    [self setupData];
    [self setupRightView];
}

- (void)setupRightView
{
    if (self.item.badgeValue) {
        WBBadgeButton *badgeButton = [WBBadgeButton buttonWithType:UIButtonTypeCustom];
        self.accessoryView = badgeButton;
        self.badgeButton = badgeButton;
        badgeButton.badgeValue = self.item.badgeValue;
    } else if ([self.item isKindOfClass:[HFSettingArrowItem class]]) {
        self.accessoryView = self.arrowView;
    } else if ([self.item isKindOfClass:[HFSettingSwitchItem class]]) {
        HFSettingSwitchItem *item = (HFSettingSwitchItem *)self.item;
        item.on = self.switchView.isOn;
        self.accessoryView = self.switchView;
    } else {
        self.accessoryView = nil;
    }
}

- (void)setupData
{
    // 1.图标
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    
    // 2.标题
    self.textLabel.text = self.item.title;
    
    // 3.子标题
    if (self.item.subtitle) {
        self.subtitleLabel.hidden = NO;
        self.subtitleLabel.text = self.item.subtitle;
    } else {
        self.subtitleLabel.hidden = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 5;
    CGFloat subtitleX = CGRectGetMaxX(self.textLabel.frame) + margin;
    CGFloat subtitleY = 0;
    CGFloat subtitleW = 100;
    CGFloat subtitleH = self.frame.size.height;
    self.subtitleLabel.frame = CGRectMake(subtitleX, subtitleY, subtitleW, subtitleH);
}



@end
