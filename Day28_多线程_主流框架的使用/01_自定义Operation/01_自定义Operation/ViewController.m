//
//  ViewController.m
//  01_自定义Operation
//
//  Created by Chiang on 16/2/24.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "CustomOperation.h"

@interface ViewController () <CustomOperationDelegate>

@property (nonatomic, strong) NSOperationQueue *queue;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    operation.delegate = self;
    [self.queue addOperation:operation];
}

#pragma mark - CustomOperationDelegate

-(void)customOperation:(CustomOperation *)customOperation didFinishedDownloadImage:(UIImage *)image {
    NSLog(@"%@", image);
    self.imageView.image = image;
}

@end
