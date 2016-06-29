//
//  ViewController.m
//  04_FMDB线程安全
//
//  Created by Jiang on 16/6/29.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()

@property (nonatomic, strong) FMDatabasePool *pool;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"data.db"];
    FMDatabasePool *pool = [FMDatabasePool databasePoolWithPath:path];
#warning 要解决FMDB线程安全问题，将所有数据库操作的代码都写在以下block中。
    [pool inDatabase:^(FMDatabase *db) {
        // 打开数据库：
        BOOL result = [db open];
        if (result) {
            NSLog(@"创建数据库成功....");
            // 除了查询语句，其他操作都统一用executeUpdate：
            BOOL tResult = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER NOT NULL, score REAL);"];
            if (tResult) {
                NSLog(@"创建表成功....");
            } else {
                NSLog(@"创建表失败....");
            }
        } else {
            NSLog(@"创建数据库失败....");
        }
    }];
    
    self.pool = pool;
}

// 事务相关：
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.pool inDatabase:^(FMDatabase *db) {
        // 开启事务：
        [db beginTransaction];
        
        [db commit];
    }];
}

@end
