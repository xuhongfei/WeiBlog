//
//  NSString+WB.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/6.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (WB)

- (CGSize)sizeWithAttributesOnFont:(UIFont *)font;
- (CGSize)sizeWithAttributesOnFont:(UIFont *)font size:(CGSize)size;
@end
