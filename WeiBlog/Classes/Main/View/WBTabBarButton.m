//
//  WBTabBarButton.m
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBTabBarButton.h"
#import "UIImage+WB.h"
#import "WBCommon.h"
#import "WBBadgeButton.h"

#define WBTabBarButtonImageRatio 0.7
#define WBTabBarButtonTitleColor (ios7 ? [UIColor blackColor] : [UIColor whiteColor])

@interface WBTabBarButton ()

@property (nonatomic, weak) WBBadgeButton *badgeButton;

@end

@implementation WBTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.imageView.contentMode = UIViewContentModeCenter;

        [self setTitleColor:WBTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:Color(236, 103, 0) forState:UIControlStateSelected];
        
        if (!ios7) {
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        
        WBBadgeButton *badgeButton = [[WBBadgeButton alloc] init];
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
        
    }
    return self;
}



- (void)setHighlighted:(BOOL)highlighted {}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * WBTabBarButtonImageRatio;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * (1 - WBTabBarButtonImageRatio);
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height - titleH;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    //KVO监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.badgeButton.titleLabel.font;
    CGSize badgeTitleSize = [self.item.badgeValue sizeWithAttributes:dictM];
    CGRect badgeFrame = self.badgeButton.frame;
    CGFloat w = badgeTitleSize.width + 10;
    CGFloat x = self.frame.size.width - w - 5;
    badgeFrame.origin.x = x;
    self.badgeButton.frame = badgeFrame;
}

@end
