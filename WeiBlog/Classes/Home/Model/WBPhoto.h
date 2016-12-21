//
//  WBPhoto.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/8.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBPhoto : NSObject

@property (nonatomic, copy) NSString *thumbnail_pic;

+ (instancetype)photoWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
/*
 "pic_urls" = (
                 {
                    "thumbnail_pic" = "http://ww1.sinaimg.cn/thumbnail/73c7ca2fgw1evvd6irdb3j20rs0rsmzj.jpg";
                 },
                 {
                    "thumbnail_pic" = "http://ww3.sinaimg.cn/thumbnail/73c7ca2fgw1evvd6jfb97j20rs0rs76j.jpg";
                 },
                 {
                    "thumbnail_pic" = "http://ww3.sinaimg.cn/thumbnail/73c7ca2fgw1evvd6karolj20rs0rsabo.jpg";
                 },
                 {
                    "thumbnail_pic" = "http://ww1.sinaimg.cn/thumbnail/73c7ca2fgw1evvd6l5dqlj20rs0rsach.jpg";
                 },
                 {
                    "thumbnail_pic" = "http://ww2.sinaimg.cn/thumbnail/73c7ca2fgw1evvd6m4e2jj20rs0rs40m.jpg";
                 },
                 {
                    "thumbnail_pic" = "http://ww4.sinaimg.cn/thumbnail/73c7ca2fgw1evvd6n1o6gj20rs0rst9r.jpg";
                 }
 );

 */