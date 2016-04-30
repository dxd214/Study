//
//  ViewController.m
//  02_plist文件存储
//
//  Created by Chiang on 16/3/3.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self writer];
    [self reader];
}

// 写入：
-(void)writer {
    NSArray *datas = @[@"YaoMing", @"YiJianLian", @"WangZhiZhi", @"BaTeEr", @"SunYue"];
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"datas.plist"];
    [datas writeToFile:filePath atomically:YES];
}

// 读取：
-(void)reader {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"datas.plist"];
    NSArray *datas = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"<--------数据：--------> %@", datas);
}

@end
