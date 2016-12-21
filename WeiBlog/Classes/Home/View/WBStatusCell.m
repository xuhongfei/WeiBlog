//
//  WBStatusCell.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/6.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBStatusCell.h"
#import "WBStatusFrame.h"
#import "WBStatus.h"
#import "WBUser.h"
#import "UIImageView+WebCache.h"
#import "UIImage+WB.h"
#import "WBStatusTopView.h"
#import "WBStatusBottomView.h"

@interface WBStatusCell ()

/** 顶层View */
@property (nonatomic, weak) WBStatusTopView *topView;

/** 底部View */
@property (nonatomic, weak) WBStatusBottomView *bottomView;

@end

@implementation WBStatusCell


+ (WBStatusCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    WBStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WBStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectedBackgroundView = [[UIView alloc] init];
        
        [self setupStatusView];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = WBStatusCellBorder;
    frame.origin.y += WBStatusCellBorder;
    frame.size.width -= WBStatusCellBorder * 2;
    frame.size.height -= WBStatusCellBorder;
    
    [super setFrame:frame];
}

- (void)setupStatusView
{
    //顶层View
    WBStatusTopView *topView = [[WBStatusTopView alloc] init];
    [self.contentView addSubview:topView];
    self.topView = topView;
    
    WBStatusBottomView *bottomView = [[WBStatusBottomView alloc] init];
    [self.contentView addSubview:bottomView];
    self.bottomView = bottomView;
}

- (void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    self.topView.frame = statusFrame.topViewF;
    self.topView.statusFrame = statusFrame;
    
    self.bottomView.frame = statusFrame.bottomViewF;
    self.bottomView.statusFrame = statusFrame;
}


@end
