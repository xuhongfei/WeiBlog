//
//  WBStatusCell.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/6.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBStatusFrame;

@interface WBStatusCell : UITableViewCell

@property (nonatomic, strong) WBStatusFrame *statusFrame;

+ (WBStatusCell *)cellWithTableView:(UITableView *)tableView;


@end
