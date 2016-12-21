//
//  WBTitleButton.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/3.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBTitleButton.h"
#import "NSString+WB.h"

#define WBTitleButtonImageW 15

@implementation WBTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.contentMode = UIViewContentModeRight;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    CGRect frame = self.frame;
    CGSize size = [title sizeWithAttributesOnFont:self.titleLabel.font];
    frame.size.width = size.width + WBTitleButtonImageW;
    frame.size.height = size.height;
    self.frame = frame;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = contentRect.size.width - WBTitleButtonImageW;
    CGFloat imageY = 0;
    CGFloat imageW = WBTitleButtonImageW;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width - WBTitleButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
