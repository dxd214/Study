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
    
    // 接收通知：
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getImage:) name:CustomOperationKEY object:nil];
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
    CustomOperation *operation = [[CustomOperation alloc] init];
    [self.queue addOperation:operation];
}

@end
