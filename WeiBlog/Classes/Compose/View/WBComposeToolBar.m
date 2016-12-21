//
//  WBComposeToolBar.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/15.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBComposeToolBar.h"
#import "UIImage+WB.h"

@implementation WBComposeToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"compose_toolbar_background"]];
        
        [self setupButtonWithImageName:@"compose_camerabutton_background" highlightedImageName:@"compose_camerabutton_background_highlighted" tag:WBComposeToolbarButtonTypeCamera];
        [self setupButtonWithImageName:@"compose_toolbar_picture" highlightedImageName:@"compose_toolbar_picture_highlighted" tag:WBComposeToolbarButtonTypePicture];
        [self setupButtonWithImageName:@"compose_mentionbutton_background" highlightedImageName:@"compose_mentionbutton_background_highlighted" tag:WBComposeToolbarButtonTypeMention];
        [self setupButtonWithImageName:@"compose_trendbutton_background" highlightedImageName:@"compose_trendbutton_background_highlighted" tag:WBComposeToolbarButtonTypeTrend];
        [self setupButtonWithImageName:@"compose_emoticonbutton_background" highlightedImageName:@"compose_emoticonbutton_background_highlighted" tag:WBComposeToolbarButtonTypeEmotion];

    }
    return self;
}

- (void)setupButtonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName tag:(int)tag
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:highlightedImageName] forState:UIControlStateHighlighted];
    button.tag = tag;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)buttonClicked:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(composeToolBar:clickedButtonType:)]) {
        [self.delegate composeToolBar:self clickedButtonType:button.tag];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *button = self.subviews[i];
        CGFloat buttonX = buttonW * i;
        button.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
    }
}

@end
