//
//  WBMessageController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/8/31.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBMessageController.h"
#import "WBCommon.h"

@interface WBMessageController ()

@end

@implementation WBMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:nil action:nil];
}


@end
