//
//  WBComposeToolBar.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/15.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBComposeToolBar;

typedef enum {
    WBComposeToolbarButtonTypeCamera ,
    WBComposeToolbarButtonTypePicture,
    WBComposeToolbarButtonTypeMention,
    WBComposeToolbarButtonTypeTrend,
    WBComposeToolbarButtonTypeEmotion
} WBComposeToolbarButtonType;

@protocol WBComposeToolBarDelegate <NSObject>

@optional
- (void)composeToolBar:(WBComposeToolBar *)toolBar clickedButtonType:(WBComposeToolbarButtonType)type;

@end

@interface WBComposeToolBar : UIView
@property (nonatomic, weak) id<WBComposeToolBarDelegate> delegate;

@end
