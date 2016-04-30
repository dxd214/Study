//
//  ViewController.m
//  01_访问百度
//
//  Created by Chiang on 16/2/25.
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
    // 创建网络请求：
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.baidu.com"]];
    // 发送网络请求：
    // 网路请求为耗时操作，应该在子线程完成。
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 网络请求完成后的block回调：
        // 传回三个参数：响应、数据、错误。
        NSLog(@"%@", response);
        NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", dataStr);
        NSLog(@"%@", connectionError);
        
        // 将数据保存至本地：
        [data writeToFile:@"/Users/Chiang/Desktop/baidu.html" atomically:YES];
        
        // 屏幕显示网页数据：
        UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:web];
        [web loadHTMLString:dataStr baseURL:nil];
    }];
    
}

@end
