//
//  ViewController.m
//  02_post请求
//
//  Created by Chiang on 16/2/26.
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
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/login/login.php"];
    // 由于post请求需要手动设置请求方式为post，所以只能使用 NSMutableURLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 请求方式：
    request.HTTPMethod = @"POST";
    // 请求体：
    NSString *str = [NSString stringWithFormat:@"username=zhangsan&password=zhang"];
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }] resume];
}

@end
