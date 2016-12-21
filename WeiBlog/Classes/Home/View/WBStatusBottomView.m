//
//  WBStatusBottomView.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/7.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBStatusBottomView.h"
#import "UIImage+WB.h"
#import "WBStatusFrame.h"
#import "WBStatus.h"

@interface WBStatusBottomView ()

@property (nonatomic, weak) UIButton *leftButton;
@property (nonatomic, weak) UIButton *middleButton;
@property (nonatomic, weak) UIButton *rightButton;

@property (nonatomic, weak) UIImageView *leftLine;
@property (nonatomic, weak) UIImageView *rightLine;

@end

@implementation WBStatusBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizableImageWithImageName:@"timeline_card_bottom_background"];
        self.highlightedImage = [UIImage resizableImageWithImageName:@"timeline_card_bottom_background_highlighted"];
        
        self.leftButton = [self buttonWithTitle:@"转发" imageName:@"timeline_icon_retweet" backgroundImageName:@"timeline_card_leftbottom_highlighted"];
        self.middleButton = [self buttonWithTitle:@"评论" imageName:@"timeline_icon_comment" backgroundImageName:@"timeline_card_middlebottom_highlighted"];
        self.rightButton = [self buttonWithTitle:@"赞" imageName:@"timeline_icon_unlike" backgroundImageName:@"timeline_card_rightbottom_highlighted"];
        
        self.leftLine = [self lineViewByImageView];
        self.rightLine = [self lineViewByImageView];
        
    }
    
    return self;
}

- (UIImageView *)lineViewByImageView
{
    UIImageView *line = [[UIImageView alloc] init];
    [line setImage:[UIImage imageWithName:@"timeline_card_bottom_line"]];
    [line setHighlightedImage:[UIImage imageWithName:@"timeline_card_bottom_background_highlighted"]];
    [self addSubview:line];
    
    return line;
}

- (UIButton *)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName backgroundImageName:(NSString *)backgroundImageName
{
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage resizableImageWithImageName:backgroundImageName] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:button];
    
    return button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat lineW = 1;
    CGFloat lineH = self.frame.size.height;
    CGFloat lineY = 0;
    
    CGFloat buttonW = (self.frame.size.width - lineW * 2) / 3;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    
    CGFloat leftX = 0;
    self.leftButton.frame = CGRectMake(leftX, buttonY, buttonW, buttonH);
    
    CGFloat leftLineX = CGRectGetMaxX(self.leftButton.frame);
    self.leftLine.frame =CGRectMake(leftLineX, lineY, lineW, lineH);
    
    CGFloat middleX = CGRectGetMaxX(self.leftLine.frame);
    self.middleButton.frame = CGRectMake(middleX, buttonY, buttonW, buttonH);
    
    CGFloat rightLineX = CGRectGetMaxX(self.middleButton.frame);
    self.rightLine.frame =CGRectMake(rightLineX, lineY, lineW, lineH);
    
    CGFloat rightX = CGRectGetMaxX(self.rightLine.frame);;
    self.rightButton.frame = CGRectMake(rightX, buttonY, buttonW, buttonH);
}

- (void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    WBStatus *status = statusFrame.status;
    
    if (status.reposts_count) {
        NSString *title = [NSString stringWithFormat:@"%d", status.reposts_count];
        [self.leftButton setTitle:title forState:UIControlStateNormal];
    } else {
        [self.leftButton setTitle:@"转发" forState:UIControlStateNormal];
    }
    
    if (status.comments_count) {
        NSString *title = [NSString stringWithFormat:@"%d", status.comments_count];
        [self.middleButton setTitle:title forState:UIControlStateNormal];
    } else {
        [self.middleButton setTitle:@"评论" forState:UIControlStateNormal];
    }
    
    if (status.attitudes_count) {
        NSString *title = [NSString stringWithFormat:@"%d", status.attitudes_count];
        [self.rightButton setTitle:title forState:UIControlStateNormal];
    } else {
        [self.rightButton setTitle:@"赞" forState:UIControlStateNormal];
    }
}

@end
