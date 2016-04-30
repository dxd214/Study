//
//  ViewController.m
//  01_手势识别相关
//
//  Created by Chiang on 16/3/9.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // <-----------------------轻触手势：---------------------->
    // 创建手势对象：
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(runToTouch:)];
    // 设置对象属性：
    // 点击次数：
    tgr.numberOfTapsRequired = 1;
    // 手指数量：
    tgr.numberOfTouchesRequired = 1;
    
    tgr.delegate = self;
    
    // 添加：
    [self.imageView addGestureRecognizer:tgr];
    
    // <--------------------------长按手势：--------------------------->
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTouch:)];
    // 设置长按时间：
    lpgr.minimumPressDuration = 2;
    // 允许偏移量：
    lpgr.allowableMovement = 30;
    [self.imageView addGestureRecognizer:lpgr];
    
    // <---------------------------拖拽手势：---------------------------------->
    UIPanGestureRecognizer *pgr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panTouch:)];
    [self.imageView addGestureRecognizer:pgr];
}

// 轻触手势：
-(void)runToTouch:(UITapGestureRecognizer *)tgr {
    NSLog(@"%s", __func__);
}

// 长按手势：
-(void)longTouch:(UILongPressGestureRecognizer *)lpgr {
//    NSLog(@"%s", __func__);
    
    if (lpgr.state == UIGestureRecognizerStateBegan) {
        NSLog(@"%@", @"UIGestureRecognizerStateBegan......");
        [UIView animateWithDuration:0.5f animations:^{
            self.imageView.alpha = 0.5f;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5f animations:^{
                self.imageView.alpha = 1.0f;
            }];
        }];
    }
}

// 拖拽手势：
-(void)panTouch:(UIPanGestureRecognizer *)pgr {
    CGPoint pgrPoint = [pgr translationInView:pgr.view];
    NSLog(@"%@", NSStringFromCGPoint(pgrPoint));
    
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, pgrPoint.x, pgrPoint.y);
//    self.imageView.transform = CGAffineTransformMakeTranslation(pgrPoint.x, pgrPoint.y);
    
    // 每一次平移后都把当前point归0:
    [pgr setTranslation:CGPointZero inView:pgr.view];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // 获取坐标点：
    CGPoint locationPoint = [touch locationInView:touch.view];
    
    if (locationPoint.y < self.imageView.bounds.size.height * 0.5) {
        return YES;
    }
    return NO;
}

@end
