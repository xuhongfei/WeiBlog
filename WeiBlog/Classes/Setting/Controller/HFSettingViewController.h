//
//  HFSettingViewController.h
//  WeiBlog
//
//  Created by xuhongfei on 15/9/21.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HFSettingGroup;

@interface HFSettingViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *groups;

- (HFSettingGroup *)addGroup;

@end
