//
//  ViewController.m
//  04_base64加密
//
//  Created by Chiang on 16/2/27.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test2];
    [self test3];
}

// 文字加密：
-(void)test1 {
    NSString *str = @"hello world";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"加密前：%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    // 将data用base64进行加密：
    data = [data base64EncodedDataWithOptions:0];
    NSString *base64Str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"加密后：%@", base64Str);
}

// 文件加密：
-(void)test2 {
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/Chiang/Downloads/6-140213163313.jpg"];
    data = [data base64EncodedDataWithOptions:0];
    
    [data writeToFile:@"/Users/Chiang/Downloads/6-14021316.jpg" atomically:YES];
}

// 文件解密：
-(void)test3 {
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/Chiang/Downloads/6-14021316.jpg"];
    data = [[NSData alloc] initWithBase64EncodedData:data options:0];
    [data writeToFile:@"/Users/Chiang/Downloads/6.jpg" atomically:YES];
}

@end
