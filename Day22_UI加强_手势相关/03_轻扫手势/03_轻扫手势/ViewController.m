//
//  ViewController.m
//  03_轻扫手势
//
//  Created by Chiang on 16/3/9.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.index = 1;
    
    // <----------------轻扫手势：------------------->
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeTouch:)];
    // 设置轻扫的方向：
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeTouch:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.imageView addGestureRecognizer:swipeRight];
}

-(void)swipeTouch:(UISwipeGestureRecognizer *)swipe {
    NSLog(@"%s", __func__);
    
    CATransition *tran = [CATransition animation];
    tran.type = @"cube";
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.index--;
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        self.index++;
    }
    
    if (self.index > 5) {
        self.index = 1;
    } else if (self.index < 1) {
        self.index = 5;
    }
    
    // 拼接字符串：
    NSString *imageName = [NSString stringWithFormat:@"img%02ld", self.index];
    UIImage *image = [UIImage imageNamed:imageName];
    self.imageView.image = image;
    
    [self.imageView.layer addAnimation:tran forKey:nil];
}
@end
