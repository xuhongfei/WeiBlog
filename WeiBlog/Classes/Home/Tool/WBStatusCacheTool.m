//
//  WBStatusCacheTool.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/18.
//  Copyright © 2015年 xuhongfei. All rights reserved.
//

#import "WBStatusCacheTool.h"
#import "FMDB.h"
#import "WBAccount.h"
#import "WBAccountTool.h"
#import "WBStatus.h"
#import "WBHomeStatusesParam.h"

static FMDatabaseQueue *_queue;

@implementation WBStatusCacheTool

+ (void)initialize
{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"statuses.sqlite"];
    
//    NSLog(@"%@", path);
    
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"create table if not exists t_status(id integer primary key autoincrement, access_token text, idstr text, status blob);"];
    }];
}

+ (void)addStatus:(WBStatus *)status
{
    WBAccount *account = [WBAccountTool account];
    NSData *statusData = [NSKeyedArchiver archivedDataWithRootObject:status];
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"insert into t_status(access_token, idstr, status) values (?, ?, ?);", account.access_token, status.idstr, statusData];
    }];
}

+ (void)addStatuses:(NSArray *)statusArray
{
    for (WBStatus *status in statusArray) {
        [self addStatus:status];
    }
}

+ (NSArray *)statusesWithParam:(WBHomeStatusesParam *)param
{
    __block NSMutableArray *statusArray = nil;
    
    [_queue inDatabase:^(FMDatabase *db) {
        
        statusArray = [NSMutableArray array];
        
        WBAccount *account = [WBAccountTool account];
        FMResultSet *rs = nil;
        if (param.since_id) {
            rs = [db executeQuery:@"select * from t_status where access_token=? and idstr>? order by idstr desc limit 0,?;", account.access_token, param.since_id, param.count];
        } else if (param.max_id) {
            rs = [db executeQuery:@"select * from t_status where access_token=? and idstr<? order by idstr desc limit 0,?;", account.access_token, param.max_id, param.count];
        } else {
            rs = [db executeQuery:@"select * from t_status where access_token=? order by idstr desc limit 0, ?;", account.access_token, param.count];
        }
        
        while (rs.next) {
            NSData *statusData = [rs dataNoCopyForColumn:@"status"];
            WBStatus *status = [NSKeyedUnarchiver unarchiveObjectWithData:statusData];
            [statusArray addObject:status];
        }
    }];
    
    return statusArray;
}

@end
