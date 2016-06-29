//
//  ViewController.m
//  03_FMDB框架的使用
//
//  Created by Jiang on 16/6/29.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "FMDB.h"

@interface ViewController ()

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建数据库：
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"data.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:path];
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
    self.db = db;
}

// 增：
- (IBAction)add:(UIButton *)sender {
    for (int i = 0; i < 100; i++) {
        NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO t_student (name, age, score) VALUES ('%@', %d, %f);", @"YaoMing", 10 + i, 60.0 + i];
        BOOL result = [self.db executeUpdate:sqlStr];
        if (result) {
            NSLog(@"添加数据成功....");
        } else {
            NSLog(@"添加数据失败....");
        }
    }
}

// 删：
- (IBAction)delete:(UIButton *)sender {
    
}

// 改：
- (IBAction)update:(UIButton *)sender {
    
}

// 查：
- (IBAction)select:(UIButton *)sender {
    NSString *sqlStr = @"SELECT id, name, age, score FROM t_student WHERE score > 60 AND score < 80;";
    FMResultSet *result = [self.db executeQuery:sqlStr];
    while ([result next]) {
        NSString *name = [result stringForColumnIndex:1];
        CGFloat score = [result doubleForColumnIndex:3];
        
        NSLog(@"name : %@ -- score: %lf", name, score);
    }
}

@end
