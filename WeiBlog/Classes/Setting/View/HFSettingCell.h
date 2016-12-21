//
//  HFSettingCell.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HFSettingItem;

@interface HFSettingCell : UITableViewCell

@property (nonatomic, strong) HFSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
