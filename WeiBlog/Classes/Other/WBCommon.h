//
//  WBCommon.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/1.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIImage+WB.h"

//判断是否为ios7以上版本的设备
#define ios7 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)

//根据RGB取色
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


//OAuth
#define WBOAuthClientId @"1171523424"
#define WBOAuthRedirectURL @"https://api.weibo.com/oauth2/default.html"
#define WBOAuthClientSecret @"6887f11008c2e9898143aff45bc237b1"

#define UserDefaults [NSUserDefaults standardUserDefaults]

@interface WBCommon : NSObject

@end
