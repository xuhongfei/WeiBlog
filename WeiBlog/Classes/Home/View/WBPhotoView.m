//
//  WBPhotoView.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/8.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBPhotoView.h"
#import "UIImage+WB.h"
#import "WBPhoto.h"
#import "UIImageView+WebCache.h"

@interface WBPhotoView ()

@property (nonatomic, weak) UIImageView *gifView;

@end

@implementation WBPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        UIImage *image = [UIImage imageWithName:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    
    return self;
}

- (void)setPhoto:(WBPhoto *)photo
{
    _photo = photo;
    
    self.gifView.hidden = ![photo.thumbnail_pic hasSuffix:@"gif"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.frame = self.bounds;
}

@end
