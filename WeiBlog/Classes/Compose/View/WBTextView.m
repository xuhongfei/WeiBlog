//
//  WBTextView.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/15.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBTextView.h"
#import "NSString+WB.h"

@interface WBTextView ()

@property (nonatomic, weak) UILabel *placeholderLabel;

@end

@implementation WBTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.font = self.font;
        placeholderLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextViewTextDidChangeNotification object:self];
    }
    
    return self;
}

- (void)textDidChanged:(NSNotification *)notification
{
    self.placeholderLabel.hidden = self.text.length;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    self.placeholderLabel.text = [placeholder copy];
    if (placeholder.length) {
        self.placeholderLabel.hidden = NO;
        
        CGFloat placeholderX = 8;
        CGFloat placeholderY = 8;
        CGFloat maxH = CGFLOAT_MAX;
        CGFloat maxW = self.frame.size.width - 2 * placeholderX;
        CGSize size = [placeholder sizeWithAttributesOnFont:self.placeholderLabel.font size:CGSizeMake(maxW, maxH)];
        self.placeholderLabel.frame = (CGRect){{placeholderX, placeholderY}, size};
    } else {
        self.placeholderLabel.hidden = YES;
    }
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font = font;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
