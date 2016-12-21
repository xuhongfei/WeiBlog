//
//  WBNewfeatureViewController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/4.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBNewfeatureViewController.h"
#import "WBTabBarController.h"
#import "WBCommon.h"

#define WBNewfeatureImageCount 3

@interface WBNewfeatureViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation WBNewfeatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupScrollView];
    
    [self setupPageControl];
}

- (void)setupPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    CGFloat x = self.view.frame.size.width * 0.5;
    CGFloat y = self.view.frame.size.height - 30;
    pageControl.center = CGPointMake(x, y);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    pageControl.numberOfPages = WBNewfeatureImageCount;
    pageControl.pageIndicatorTintColor = Color(189, 189, 189);
    pageControl.currentPageIndicatorTintColor = Color(253, 98, 42);
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    CGFloat imageW = self.view.frame.size.width;
    CGFloat imageH = self.view.frame.size.height;
    for (int index = 0; index < WBNewfeatureImageCount; index ++) {
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d", index + 1];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        [scrollView addSubview:imageView];
        
        CGFloat imageX = index * imageW;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        
        if (index == WBNewfeatureImageCount - 1) {
            [self setupLastImageView:imageView];
        }

    }

    scrollView.contentSize = CGSizeMake(imageW * WBNewfeatureImageCount, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate= self;
}

- (void)setupLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled = YES;
    
    UIButton *startButton = [[UIButton alloc] init];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat centerX = imageView.frame.size.width * 0.5;
    CGFloat centerY = imageView.frame.size.height * 0.6;
    startButton.center = CGPointMake(centerX, centerY);
    startButton.bounds = (CGRect){CGPointZero, startButton.currentBackgroundImage.size};
    [startButton addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
    
    UIButton *checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkButton setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateNormal];
    [checkButton setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateSelected];
    [checkButton setTitle:@"分享给大家" forState:UIControlStateNormal];
    [checkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkButton.titleLabel.font = [UIFont systemFontOfSize:16];
    CGFloat x = imageView.frame.size.width * 0.5;
    CGFloat y = imageView.frame.size.height * 0.5;
    checkButton.center = CGPointMake(x, y);
    checkButton.bounds = (CGRect){CGPointZero, startButton.frame.size};
    [checkButton addTarget:self action:@selector(didCheckboxClicked:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:checkButton];
}

- (void)start:(UIButton *)button
{
    self.view.window.rootViewController = [[WBTabBarController alloc] init];
}

- (void)didCheckboxClicked:(UIButton *)button
{
    button.selected = !button.selected;
}

#pragma mark - scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat imageW = self.view.frame.size.width;
    double pageDoub = offsetX / imageW;
    int pageInt = (int)(pageDoub + 0.5);
    
    self.pageControl.currentPage = pageInt;
}

@end
