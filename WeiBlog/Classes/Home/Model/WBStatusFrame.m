//
//  WBStatusFrame.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/6.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBStatusFrame.h"
#import "WBStatus.h"
#import "WBUser.h"
#import "NSString+WB.h"
#import "WBPhotosView.h"


@implementation WBStatusFrame

- (void)setStatus:(WBStatus *)status
{
    _status = status;
    
    //定义
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - WBStatusCellBorder * 2;
    
    //顶部View
    CGFloat topXY = 0;
    CGFloat topW = cellW;
    
    //icon
    CGFloat iconX = WBStatusCellBorder;
    CGFloat iconY = WBStatusCellBorder;
    CGFloat iconWH = 35;
    _iconViewF = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    //userName
    CGFloat userNameX = CGRectGetMaxX(self.iconViewF) + WBStatusCellBorder;
    CGFloat userNameY = iconY;
    CGSize userNameSize = [status.user.name sizeWithAttributesOnFont:WBStatusUserNameFont];
    _userNameLabelF = (CGRect){{userNameX, userNameY}, userNameSize};
    
    //vipImage
    if (status.user.mbtype > 2) {
        CGFloat vipX = CGRectGetMaxX(self.userNameLabelF) + WBStatusCellBorder;
        CGFloat vipY = userNameY;
        CGFloat vipW = 14;
        CGFloat vipH = userNameSize.height;
        _vipViewF = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    //时间
    CGFloat timeX = userNameX;
    CGFloat timeY = CGRectGetMaxY(self.userNameLabelF) + WBStatusCellBorder;
    CGSize timeSize = [status.createdTime sizeWithAttributesOnFont:WBStatusTimeFont];
    _timeLabelF = (CGRect){{timeX, timeY}, timeSize};
    
    //来源
    CGFloat sourceX = CGRectGetMaxX(self.timeLabelF) + WBStatusCellBorder;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithAttributesOnFont:WBStatusSourceFont];
    _sourceLabelF = (CGRect){{sourceX, sourceY}, sourceSize};
    
    //内容
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(self.iconViewF), CGRectGetMaxY(self.timeLabelF)) + WBStatusCellBorder;
    CGFloat contentW = cellW - WBStatusCellBorder * 2;
    CGSize contentSize = [status.text sizeWithAttributesOnFont:WBStatusTextFont size:CGSizeMake(contentW, CGFLOAT_MAX)];
    _contentLabelF = (CGRect){{contentX, contentY}, contentSize};
    
    //图片
    if (status.pic_urls.count) {
        CGFloat picX = contentX;
        CGFloat picY = CGRectGetMaxY(self.contentLabelF) + WBStatusCellBorder;
        CGSize picSize = [WBPhotosView photosViewSizeWithPhotosCount:(int)status.pic_urls.count];
        _photosViewF = (CGRect){{picX, picY}, picSize};
        
        CGFloat topH = CGRectGetMaxY(self.photosViewF) + WBStatusCellBorder;
        _topViewF = CGRectMake(topXY, topXY, topW, topH);
    } else {
        CGFloat topH = CGRectGetMaxY(self.contentLabelF) + WBStatusCellBorder;
        _topViewF = CGRectMake(topXY, topXY, topW, topH);
    }
    
    //被转发的微博
    if (status.retweeted_status) {
        
        WBStatus *retweetedStatus = status.retweeted_status;
        
        //转发微博 View
        CGFloat reViewX = contentX;
        CGFloat reViewY = CGRectGetMaxY(self.contentLabelF) + WBStatusCellBorder;
        CGFloat reViewW = cellW - WBStatusCellBorder * 2;
        
        //名称
        CGFloat reUserNameX = WBStatusCellBorder;
        CGFloat reUserNameY = WBStatusCellBorder;
        
        CGSize reUserNameSize = [retweetedStatus.user.name sizeWithAttributesOnFont:WBRetweetedStatusUserNameFont];
        _retweetedUserNameLabelF = (CGRect){{reUserNameX, reUserNameY}, reUserNameSize};
        
        //内容
        CGFloat reContentX = reViewX;
        CGFloat reContentY = CGRectGetMaxY(_retweetedUserNameLabelF) + WBStatusCellBorder;
        CGSize reContentMaxSize = CGSizeMake(reViewW - 2 * WBStatusCellBorder, CGFLOAT_MAX);
        CGSize reContentSize = [retweetedStatus.text sizeWithAttributesOnFont:WBRetweetedStatusTextFont size:reContentMaxSize];
        _retweetedContentLabelF = (CGRect){{reContentX, reContentY}, reContentSize};
        
        //图片
        if (retweetedStatus.pic_urls.count) {
            CGFloat rePicX = reContentX;
            CGFloat rePicY = CGRectGetMaxY(self.retweetedContentLabelF) + WBStatusCellBorder;
            CGSize rePicSize = [WBPhotosView photosViewSizeWithPhotosCount:(int)retweetedStatus.pic_urls.count];
            _retweetedPhotosViewF = (CGRect){{rePicX, rePicY}, rePicSize};
            
            CGFloat reViewH = CGRectGetMaxY(self.retweetedPhotosViewF) + WBStatusCellBorder;
            _retweetedViewF = CGRectMake(reViewX, reViewY, reViewW, reViewH);
        } else {
            CGFloat reViewH = CGRectGetMaxY(self.retweetedContentLabelF) + WBStatusCellBorder;
            _retweetedViewF = CGRectMake(reViewX, reViewY, reViewW, reViewH);
        }
        
        CGFloat topH = CGRectGetMaxY(self.retweetedViewF) + WBStatusCellBorder;
        _topViewF = CGRectMake(topXY, topXY, topW, topH);
    } 
    
    CGFloat bottomX = 0;
    CGFloat bottomY = CGRectGetMaxY(_topViewF);
    CGFloat bottomW = cellW;
    CGFloat bottomH = 30;
    _bottomViewF = CGRectMake(bottomX, bottomY, bottomW, bottomH);
    
    _cellHeight = CGRectGetMaxY(self.bottomViewF) + WBStatusCellBorder;
}

@end
