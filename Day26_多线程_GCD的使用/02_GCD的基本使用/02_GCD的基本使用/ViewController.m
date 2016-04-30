//
//  ViewController.m
//  02_GCD的基本使用
//
//  Created by Chiang on 16/2/20.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test1];
    [self test2];
}

-(void)test1 {
    // 任务：
//    dispatch_block_t block = ^{
//        NSLog(@"%@", [NSThread currentThread]);
//    };
//    // 队列：
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    // 任务加入队列：
//    dispatch_async(queue, block);
    
    // 简单写法：
    for (int i = 0; i < 20; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%d-%@", i, [NSThread currentThread]);
        });
    }
}

-(void)test2 {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self downloadImage];
    });
}

// 下载图片:
-(void)downloadImage {
    NSURL *url = [NSURL URLWithString:@"http://b.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=e0f56a80ab014c08196e20a33a4b2e30/38dbb6fd5266d01600f57901952bd40735fa352e.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    NSLog(@"%@", image);
//    self.imageView.image = image;
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.imageView.image = image;
    });
}

@end
