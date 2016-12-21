//
//  WBPhotosView.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/8.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBPhotosView.h"
#import "WBPhotoView.h"
#import "WBPhoto.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"

#define WBPhotoW 70
#define WBPhotoH 70
#define WBPhotoMargin 10

@implementation WBPhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        for (int i = 0; i < 9; i ++) {
            WBPhotoView *photoView = [[WBPhotoView alloc] init];
            photoView.userInteractionEnabled = YES;
            photoView.tag = i;
            [photoView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)]];
            [self addSubview:photoView];
        }
    }
    
    return self;
}

- (void)tapImage:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSUInteger count = self.photos.count;
    
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        WBPhoto *wbPhoto = self.photos[i];
        NSString *url = [wbPhoto.thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = [NSURL URLWithString:url];
        photo.srcImageView = self.subviews[i];
        [photos addObject:photo];
    }
    
    MJPhotoBrowser *photoBrower = [[MJPhotoBrowser alloc] init];
    photoBrower.currentPhotoIndex = tapGestureRecognizer.view.tag;
    photoBrower.photos = photos;
    [photoBrower show];
}

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    
    for (int i = 0; i < self.subviews.count; i ++) {
        
        WBPhotoView *photoView = self.subviews[i];
        
        if (i < photos.count) {
            photoView.hidden = NO;
            
            photoView.photo = photos[i];
            
            int maxColumns = (photos.count == 4) ? 2 : 3;
            int col = i % maxColumns;
            int row = i / maxColumns;
            CGFloat photoX = col * (WBPhotoW + WBPhotoMargin);
            CGFloat photoY = row * (WBPhotoH + WBPhotoMargin);
            photoView.frame = CGRectMake(photoX, photoY, WBPhotoW, WBPhotoH);
            
            if (photos.count == 1) {
                photoView.contentMode = UIViewContentModeScaleAspectFit;
                photoView.clipsToBounds = NO;
            } else {
                photoView.clipsToBounds = YES;
            }
            
        } else {
            photoView.hidden = YES;
        }
    }
}

+ (CGSize)photosViewSizeWithPhotosCount:(int)count
{
    // 一行最多有3列
    int maxColumns = (count == 4) ? 2 : 3;
    
    //  总行数
    int rows = (count + maxColumns - 1) / maxColumns;
    // 高度
    CGFloat photosH = rows * WBPhotoH + (rows - 1) * WBPhotoMargin;
    
    // 总列数
    int cols = (count >= maxColumns) ? maxColumns : count;
    // 宽度
    CGFloat photosW = cols * WBPhotoW + (cols - 1) * WBPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
    /**
     一共60条数据 == count
     一页10条 == size
     总页数 == pages
     pages = (count + size - 1)/size;
     */
}

@end
