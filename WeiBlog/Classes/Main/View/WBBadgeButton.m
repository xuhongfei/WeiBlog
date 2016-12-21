//
//  WBBadgeButton.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/1.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBBadgeButton.h"
#import "UIImage+WB.h"

@implementation WBBadgeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundImage:[UIImage resizableImageWithImageName:@"main_badge"] forState:UIControlStateNormal];
        self.hidden = YES;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        self.userInteractionEnabled = NO;
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    }
    
    return self;
}


- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue && [badgeValue intValue] != 0) {
        self.hidden = NO;
        
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        CGRect frame = self.frame;
        
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        dictM[NSFontAttributeName] = self.titleLabel.font;
        CGSize badgeTitleSize = [badgeValue sizeWithAttributes:dictM];
        
        CGFloat y = 5;
        CGFloat w = self.currentBackgroundImage.size.width;
        CGFloat h = self.currentBackgroundImage.size.height;
        if (badgeValue.length > 1) {
            w = badgeTitleSize.width + 10;
        }
        
        frame.origin.y = y;
        frame.size.height = h;
        frame.size.width = w;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}

@end
