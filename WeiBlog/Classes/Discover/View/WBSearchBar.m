//
//  WBSearchBar.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/3.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBSearchBar.h"
#import "WBCommon.h"

@implementation WBSearchBar

+ (instancetype)searchBar
{
    return [[WBSearchBar alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackground:[UIImage resizableImageWithImageName:@"searchbar_textfield_background"]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        imageView.contentMode = UIViewContentModeCenter;
        self.leftView = imageView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.font = [UIFont systemFontOfSize:13];
        
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索" attributes:attrs];
    }
    
    return self;
}


- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    return CGRectMake(0, 0, 30, self.frame.size.height);
}


@end
