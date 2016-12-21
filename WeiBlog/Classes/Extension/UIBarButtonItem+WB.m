//
//  UIBarButtonItem+WB.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/3.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "UIBarButtonItem+WB.h"
#import "UIImage+WB.h"
@implementation UIBarButtonItem (WB)

+ (UIBarButtonItem *)setupNavigationBarButtonItemWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action
{
    
    UIButton *buttonItem = [[UIButton alloc] init];
    [buttonItem setImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [buttonItem setImage:[UIImage imageWithName:selectedImageName] forState:UIControlStateHighlighted];
    CGFloat buttonW = buttonItem.currentImage.size.width;
    CGFloat buttonH = buttonItem.currentImage.size.height;
    buttonItem.frame = CGRectMake(0, 0, buttonW, buttonH);
    [buttonItem addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:buttonItem];
}

@end
