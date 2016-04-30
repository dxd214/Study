//
//  ViewController.m
//  01_重力行为
//
//  Created by Chiang on 16/3/15.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (nonatomic, strong) UIDynamicAnimator *uda;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建物理仿真器：
    UIDynamicAnimator *uda = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    // 创建重力行为：
    UIGravityBehavior *ugb = [[UIGravityBehavior alloc] initWithItems:@[self.myView]];
    // 设置向量：
//    ugb.gravityDirection = CGVectorMake(100, 100);
    // 弧度和方向：
    ugb.angle = M_PI * 0.6;
    ugb.magnitude = 100;
    
    // 当动画执行时会不停调用action：
    [ugb setAction:^{
        NSLog(@"action........");
    }];
    
    // 添加进物理仿真器：
    [uda addBehavior:ugb];
    
    self.uda = uda;
}

@end
