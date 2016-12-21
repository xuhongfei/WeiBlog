//
//  WBRetweetedStatusView.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/7.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBRetweetedStatusView.h"
#import "WBUser.h"
#import "WBStatus.h"
#import "WBStatusFrame.h"
#import "UIImageView+WebCache.h"
#import "UIImage+WB.h"
#import "WBPhoto.h"
#import "WBPhotosView.h"

@interface WBRetweetedStatusView ()

/**  被转发微博 用户名称 Label */
@property (nonatomic, weak) UILabel *retweetedUserNameLabel;
/**  被转发微博 内容 Label */
@property (nonatomic, weak) UILabel *retweetedContentLabel;
/**  被转发微博 图片 View */
@property (nonatomic, weak) WBPhotosView *retweetedPhotosView;

@end

@implementation WBRetweetedStatusView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizableImageWithImageName:@"timeline_retweet_background" top:0.9 left:0.9];
        self.highlightedImage = [UIImage resizableImageWithImageName:@"timeline_retweet_background_highlighted" top:0.9 left:0.9];
        
        UILabel *retweetedUserNameLabel = [[UILabel alloc] init];
        retweetedUserNameLabel.font = WBRetweetedStatusUserNameFont;
        [self addSubview:retweetedUserNameLabel];
        self.retweetedUserNameLabel = retweetedUserNameLabel;
        
        UILabel *retweetedContentLabel = [[UILabel alloc] init];
        retweetedContentLabel.font = WBRetweetedStatusTextFont;
        retweetedContentLabel.numberOfLines = 0;
        [self addSubview:retweetedContentLabel];
        self.retweetedContentLabel = retweetedContentLabel;
        
        WBPhotosView *retweetedPhotosView = [[WBPhotosView alloc] init];
        [self addSubview:retweetedPhotosView];
        self.retweetedPhotosView = retweetedPhotosView;
        
    }
    return self;
}

- (void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    WBStatus *status = statusFrame.status;
    WBStatus *retweetedStatus = status.retweeted_status;
    WBUser *retweetedUser = retweetedStatus.user;
    
    self.retweetedUserNameLabel.text = retweetedUser.name;
    self.retweetedUserNameLabel.frame = statusFrame.retweetedUserNameLabelF;
    
    self.retweetedContentLabel.text = retweetedStatus.text;
    self.retweetedContentLabel.frame = statusFrame.retweetedContentLabelF;
    
    if (retweetedStatus.pic_urls.count) {
        self.retweetedPhotosView.hidden = NO;
        
        self.retweetedPhotosView.frame = statusFrame.retweetedPhotosViewF;
        self.retweetedPhotosView.photos = retweetedStatus.pic_urls;
    } else {
        self.retweetedPhotosView.hidden = YES;
    }
    
}

@end
