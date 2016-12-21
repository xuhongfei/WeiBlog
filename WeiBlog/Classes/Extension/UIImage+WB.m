//
//  UIImage+WB.m
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "UIImage+WB.h"
#import "WBCommon.h"

@implementation UIImage (WB)

+ (UIImage *)imageWithName:(NSString *)name
{
    if (ios7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (!image) {
            image = [UIImage imageNamed:name];
        }
        return image;
    } else {
        return [UIImage imageNamed:name];
    }
}

+ (UIImage *)resizableImageWithImageName:(NSString *)name
{
    return [UIImage resizableImageWithImageName:name top:.5 left:.5];
}

+ (UIImage *)resizableImageWithImageName:(NSString *)name top:(float)top left:(float)left
{
    UIImage *image = [UIImage imageWithName:name];
    CGFloat w = image.size.width * left;
    CGFloat h = image.size.height * top;
    return  [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeTile];
}

@end
