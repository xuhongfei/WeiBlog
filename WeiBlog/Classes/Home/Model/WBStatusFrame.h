//
//  WBStatusFrame.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/6.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WBStatusCellBorder 5

#define WBStatusUserNameFont [UIFont systemFontOfSize:13]
#define WBStatusTimeFont [UIFont systemFontOfSize:11]
#define WBStatusSourceFont [UIFont systemFontOfSize:11]
#define WBStatusTextFont [UIFont systemFontOfSize:11]

#define WBRetweetedStatusUserNameFont [UIFont systemFontOfSize:13]
#define WBRetweetedStatusTextFont [UIFont systemFontOfSize:11]

@class WBStatus;

@interface WBStatusFrame : NSObject

@property (nonatomic, strong) WBStatus *status;

/** 顶层 View */
@property (nonatomic, assign, readonly) CGRect topViewF;
/** 头像 View */
@property (nonatomic, assign, readonly) CGRect iconViewF;
/** VIP View */
@property (nonatomic, assign, readonly) CGRect vipViewF;
/** 用户名称 Label */
@property (nonatomic, assign, readonly) CGRect userNameLabelF;
/** 发表时间 Label */
@property (nonatomic, assign, readonly) CGRect timeLabelF;
/** 来源 Label */
@property (nonatomic, assign, readonly) CGRect sourceLabelF;
/** 内容 Label */
@property (nonatomic, assign, readonly) CGRect contentLabelF;
/** 图片 View */
@property (nonatomic, assign, readonly) CGRect photosViewF;

/**  被转发微博 View */
@property (nonatomic, assign, readonly) CGRect retweetedViewF;
/**  被转发微博 用户名称 Label */
@property (nonatomic, assign, readonly) CGRect retweetedUserNameLabelF;
/**  被转发微博 内容 Label */
@property (nonatomic, assign, readonly) CGRect retweetedContentLabelF;
/**  被转发微博 图片 View */
@property (nonatomic, assign, readonly) CGRect retweetedPhotosViewF;

/**  底部 View */
@property (nonatomic, assign, readonly) CGRect bottomViewF;

/** cell的高度*/
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
