//
//  WBUserUnreadCountResult.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/16.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUserUnreadCountResult : NSObject

/*
 *新微博未读数
 */
@property (nonatomic, assign) int status;

/*
 *新粉丝数
 */
@property (nonatomic, assign) int follower;

/*
 *新评论数
 */
@property (nonatomic, assign) int cmt;

/*
 *新私信数
 */
@property (nonatomic, assign) int dm;

/*
 *新提及我的微博数
 */
@property (nonatomic, assign) int mention_status;

/*
 *新提及我的评论数
 */
@property (nonatomic, assign) int mention_cmt;

- (int)messageCount;
- (int)count;

@end


/*
 status	int	新微博未读数
 follower	int	新粉丝数
 cmt	int	新评论数
 dm	int	新私信数
 mention_status	int	新提及我的微博数
 mention_cmt	int	新提及我的评论数
 group	int	微群消息未读数
 private_group	int	私有微群消息未读数
 notice	int	新通知未读数
 invite	int	新邀请未读数
 badge	int	新勋章数
 photo	int	相册消息未读数
 msgbox	int	{{{3}}}
 */