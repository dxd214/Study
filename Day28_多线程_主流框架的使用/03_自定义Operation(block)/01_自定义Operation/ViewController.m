//
//  ViewController.m
//  01_自定义Operation
//
//  Created by Chiang on 16/2/24.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "CustomOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)getImage:(NSNotification *)notification {
    NSLog(@"%@", notification.object);
    self.imageView.image = notification.object;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test1];
}

-(void)test1 {
    NSString *imageURL = @"http://g.hiphotos.baidu.com/zhidao/pic/item/9f510fb30f2442a79fbc68ded343ad4bd113021e.jpg";
    [CustomOperation downloadImageOperationWithImageURL:imageURL andfinishedBlock:^(UIImage *image) {
        
    }];
}

@end
