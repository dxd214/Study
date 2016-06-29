//
//  ViewController.m
//  02_代码创建数据库和表
//
//  Created by Jiang on 16/6/28.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController () {
    sqlite3 *_db;
}

@end

@implementation ViewController

/**
 非查询语句用 sqlite3_exec
 查询语句用
 */

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建数据库：
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"data.sqlite"];
    NSLog(@"----------- %@", path);
    _db = nil;
    int result = sqlite3_open(path.UTF8String, &_db);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据库创建成功....");
        // 创建表：
        NSString *sqlStr = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS t_student(id INTEGER PRIMARY KEY AUTOINCREMENT, name TXET NOT NULL, age INTEGER NOT NULL, score REAL DEFAULT 60.0);"];
        char *error = NULL;
        int tableResult = sqlite3_exec(_db, sqlStr.UTF8String, NULL, NULL, &error);
        
        if (tableResult == SQLITE_OK) {
            NSLog(@"创建表成功....");
        } else {
            NSLog(@"创建表失败....");
        }
    } else {
        NSLog(@"数据库创建失败....");
    }
}

// 增：
- (IBAction)add:(UIButton *)sender {
    if (!_db) {
        NSLog(@"数据库未创建....");
        return;
    }
    
    for (int i = 0; i < 100; i++) {
        NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO t_student (name, age, score) VALUES ('%@', %d, %f);", @"YaoMing", i, i + 0.0];
        int result = sqlite3_exec(_db, sqlStr.UTF8String, NULL, NULL, NULL);
        if (result == SQLITE_OK) {
            NSLog(@"添加数据成功....");
        } else {
            NSLog(@"添加数据失败....");
        }
    }
}

// 删：
- (IBAction)delete:(UIButton *)sender {
    NSString *sqlStr = @"DELETE FROM t_student WHERE score > 90.0;";
    int result = sqlite3_exec(_db, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除数据成功....");
    } else {
        NSLog(@"删除数据失败....");
    }
}

// 改：
- (IBAction)update:(UIButton *)sender {
    NSString *sqlStr = @"UPDATE t_student SET score = 59.9 WHERE score < 60.0;";
    int result = sqlite3_exec(_db, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"更改数据成功....");
    } else {
        NSLog(@"更改数据失败....");
    }
}

// 查：
- (IBAction)select:(UIButton *)sender {
    NSString *sqlStr = @"SELECT name, score FROM t_student WHERE age > 18 AND age < 30";
    sqlite3_stmt *stmt = NULL;
    sqlite3_prepare_v2(_db, sqlStr.UTF8String, -1, &stmt, NULL);
    
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        const char *name = (const char*)sqlite3_column_text(stmt, 0);
        double score = sqlite3_column_double(stmt, 2);
    
        NSLog(@"%@ -- %f", [NSString stringWithUTF8String:name], score);
    }
}

@end
