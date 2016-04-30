//
//  ViewController.m
//  02_网络异步链接
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
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // cachePolicy缓存策略：
    // timeoutInterval超时时间：默认60秒，一般15s即可。
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://127.0.0.1/Materials/demo.json"] cachePolicy:0 timeoutInterval:15.0f];

    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"<-----> %@", [NSThread currentThread]);
        
        if (connectionError) {
            NSLog(@"网络错误.....");
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"<++++++> %@", [NSThread currentThread]);
            
            UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:webView];
            [webView loadRequest:request];
        }];
    }];
}

@end
