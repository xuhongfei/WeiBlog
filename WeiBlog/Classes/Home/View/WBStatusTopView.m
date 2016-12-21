//
//  WBStatusTopView.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/7.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBStatusTopView.h"
#import "WBStatusFrame.h"
#import "WBStatus.h"
#import "WBUser.h"
#import "UIImageView+WebCache.h"
#import "UIImage+WB.h"
#import "WBRetweetedStatusView.h"
#import "WBPhoto.h"
#import "NSString+WB.h"
#import "WBPhotosView.h"

@interface WBStatusTopView ()

/** 头像View */
@property (nonatomic, weak) UIImageView *iconView;
/** VIP View */
@property (nonatomic, weak) UIImageView *vipView;
/** 用户名称Label */
@property (nonatomic, weak) UILabel *userNameLabel;
/** 发表时间Label */
@property (nonatomic, weak) UILabel *timeLabel;
/** 来源Label */
@property (nonatomic, weak) UILabel *sourceLabel;
/** 内容Label */
@property (nonatomic, weak) UILabel *contentLabel;
/** 图片Label */
//@property (nonatomic, weak) UIImageView *picView;
@property (nonatomic, weak) WBPhotosView *photosView;

/** 被转发的微博 View */
@property (nonatomic, weak) WBRetweetedStatusView *retweetedStatusView;

@end

@implementation WBStatusTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizableImageWithImageName:@"timeline_card_top_background"];
        self.highlightedImage = [UIImage resizableImageWithImageName:@"timeline_card_top_background_highlighted"];
        
        //头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        //VIP
        UIImageView *vipView = [[UIImageView alloc] init];
        vipView.contentMode = UIViewContentModeCenter;
        [self addSubview:vipView];
        self.vipView = vipView;
        
        //用户名称
        UILabel *userNameLabel = [[UILabel alloc] init];
        [userNameLabel setFont:WBStatusUserNameFont];
        [self addSubview:userNameLabel];
        self.userNameLabel = userNameLabel;
        
        //时间
        UILabel *timeLabel = [[UILabel alloc] init];
        [timeLabel setFont:WBStatusTimeFont];
        timeLabel.textColor = [UIColor orangeColor];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        //来源
        UILabel *sourceLabel = [[UILabel alloc] init];
        [sourceLabel setFont:WBStatusSourceFont];
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        
        //正文
        UILabel *contentLabel = [[UILabel alloc] init];
        [contentLabel setFont:WBStatusTextFont];
        contentLabel.numberOfLines = 0;
        [self addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        //图片
        WBPhotosView *photosView = [[WBPhotosView alloc] init];
        [self addSubview:photosView];
        self.photosView = photosView;
        
        //被转发的微博 View
        WBRetweetedStatusView *retweetedStatusView = [[WBRetweetedStatusView alloc] init];
        [self addSubview:retweetedStatusView];
        self.retweetedStatusView = retweetedStatusView;
    }
    
    return self;
}

- (void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    WBStatus *status = statusFrame.status;
    WBUser *user = status.user;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithName:@"avatar_default_small"]];
    self.iconView.frame = statusFrame.iconViewF;
    
    self.userNameLabel.text = user.name;
    self.userNameLabel.frame = statusFrame.userNameLabelF;
    
    if (user.mbtype > 2) {
        self.vipView.hidden = NO;
        NSString *vipImageName = [NSString stringWithFormat:@"common_icon_membership_level%d", user.mbrank];
        [self.vipView setImage:[UIImage imageWithName:vipImageName]];
        self.vipView.frame = statusFrame.vipViewF;
    } else {
        self.vipView.hidden = YES;
    }
    
    self.timeLabel.text = status.createdTime;
    CGFloat timeX = statusFrame.userNameLabelF.origin.x;;
    CGFloat timeY = CGRectGetMaxY(self.userNameLabel.frame) + WBStatusCellBorder;
    CGSize timeSize = [status.createdTime sizeWithAttributesOnFont:WBStatusTimeFont];
    self.timeLabel.frame = (CGRect){{timeX, timeY}, timeSize};
    
    self.sourceLabel.text = status.source;
    CGFloat sourceX = CGRectGetMaxX(self.timeLabel.frame) + WBStatusCellBorder;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithAttributesOnFont:WBStatusSourceFont];
    self.sourceLabel.frame = (CGRect){{sourceX, sourceY}, sourceSize};
    
    self.contentLabel.text = status.text;
    self.contentLabel.frame = statusFrame.contentLabelF;
    
    if (status.pic_urls.count) {
        self.photosView.hidden = NO;

        self.photosView.frame = statusFrame.photosViewF;
        self.photosView.photos = status.pic_urls;
    } else {
        self.photosView.hidden = YES;
    }
    
    if (status.retweeted_status) {
        self.retweetedStatusView.hidden = NO;
        
        self.retweetedStatusView.frame = statusFrame.retweetedViewF;
        self.retweetedStatusView.statusFrame = statusFrame;
    } else {
        self.retweetedStatusView.hidden = YES;
    }
}

@end
