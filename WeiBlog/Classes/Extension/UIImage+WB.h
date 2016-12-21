//
//  UIImage+WB.h
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WB)
+ (UIImage *)imageWithName:(NSString *)name;

+ (UIImage *)resizableImageWithImageName:(NSString *)name;
+ (UIImage *)resizableImageWithImageName:(NSString *)name top:(float)top left:(float)left;

@end
