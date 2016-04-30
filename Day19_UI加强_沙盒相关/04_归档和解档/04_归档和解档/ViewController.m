//
//  ViewController.m
//  04_归档和解档
//
//  Created by Chiang on 16/3/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建contact对象：
    Contact *contact = [[Contact alloc] init];
    contact.name = @"YaoMing";
    contact.tel = @"18502860517";
    
    // 拿到document路径：
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"contact.arc"];
    
    // 归档：
    BOOL isArchive = [NSKeyedArchiver archiveRootObject:contact toFile:filePath];
    if (isArchive) {
        NSLog(@"归档成功.....");
    } else {
        NSLog(@"归档失败.....");
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"contact.arc"];
    Contact *contact = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSString *name = contact.name;
    NSString *tel = contact.tel;
    NSLog(@"name:%@ ----- tel:%@", name, tel);
}

@end
