//
//  WBComposePhotosView.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/16.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBComposePhotosView.h"

@implementation WBComposePhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;
    CGFloat imageViewW = 70;
    CGFloat imageViewH = imageViewW;
    int maxColumns = 4; // 一行最多显示4张图片
    CGFloat margin = (self.frame.size.width - maxColumns * imageViewW) / (maxColumns + 1);
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = self.subviews[i];
        
        CGFloat imageViewX = margin + (i % maxColumns) * (imageViewW + margin);
        CGFloat imageViewY = (i / maxColumns) * (imageViewH + margin);
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    }
}

- (void)addPhoto:(UIImage *)photo
{
    UIImageView *photoView = [[UIImageView alloc] init];
    photoView.image = photo;
    [self addSubview:photoView];
}


- (NSArray *)totalPhotos
{
    NSMutableArray *photos = [NSMutableArray array];
    
    for (UIImageView *photoView in self.subviews) {
        [photos addObject:photoView.image];
    }
    
    return photos;
}

@end
