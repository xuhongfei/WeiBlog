//
//  WBUserUnreadCountResult.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/16.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBUserUnreadCountResult.h"

@implementation WBUserUnreadCountResult

- (int)messageCount
{
    return self.cmt + self.mention_cmt + self.mention_status + self.dm;
}

- (int)count
{
    return self.messageCount + self.status + self.follower;
}

@end
