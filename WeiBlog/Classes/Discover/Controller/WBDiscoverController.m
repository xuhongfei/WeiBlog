//
//  WBDiscoverController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBDiscoverController.h"
#import "WBSearchBar.h"
#import "WBCommon.h"

@interface WBDiscoverController ()

@end

@implementation WBDiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WBSearchBar *searchBar = [WBSearchBar searchBar];
    self.navigationItem.titleView = searchBar;
    searchBar.frame = CGRectMake(0, 0, 300, 30);
}


@end
