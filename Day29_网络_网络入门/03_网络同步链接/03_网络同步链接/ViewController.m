//
//  ViewController.m
//  03_网络同步链接
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
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://127.0.0.1/Materials/demo.json"]];
    
    // 发送同步请求：
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    
    
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [webView loadData:data MIMEType:nil textEncodingName:nil baseURL:nil];

    [webView loadHTMLString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] baseURL:nil];
    [self.view addSubview:webView];
}

@end
