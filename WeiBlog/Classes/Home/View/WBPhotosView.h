//
//  WBPhotosView.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/8.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBPhotosView : UIView

@property (nonatomic, strong) NSArray *photos;

+ (CGSize)photosViewSizeWithPhotosCount:(int)count;

@end
