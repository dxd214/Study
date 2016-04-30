//
//  ViewController.m
//  10_多点触控演示
//
//  Created by Chiang on 16/3/8.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSArray *)imagesArray {
    if (!_imagesArray) {
        _imagesArray = @[[UIImage imageNamed:@"spark_blue"], [UIImage imageNamed:@"spark_cyan"], [UIImage imageNamed:@"spark_green"], [UIImage imageNamed:@"spark_magenta"], [UIImage imageNamed:@"spark_red"], [UIImage imageNamed:@"spark_yellow"]];
    }
    return _imagesArray;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touch:touches];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touch:touches];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

-(void)touch:(NSSet *)touches {
    // 通过forin循环拿到所有touch对象：
    
    NSInteger index = 0;
    for (UITouch *touch in touches) {
        NSLog(@"%ld", index);
        // 获取触摸的点：
        CGPoint locPoint = [touch locationInView:touch.view];
        UIImage *image = self.imagesArray[index];
        index++;
        // 创建图片框：
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.center = locPoint;
        [self.view addSubview:imageView];
    }
}

@end
