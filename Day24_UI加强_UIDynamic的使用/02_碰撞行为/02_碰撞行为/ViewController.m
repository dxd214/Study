//
//  ViewController.m
//  02_碰撞行为
//
//  Created by Chiang on 16/3/15.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 重力行为：
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView, self.blueView]];
    // 碰撞行为：
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView, self.blueView]];
    
    // 设置碰撞边界：
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 自定义碰撞边界：
    [collision addBoundaryWithIdentifier:@"Yao" fromPoint:CGPointMake(0, 300) toPoint:CGPointMake(375, 300)];
    
    // 辅助行为：
    UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc] initWithItems:@[self.redView, self.blueView]];
    // 弹力系数：
    item.elasticity = 0.8;
    // 阻力：
    item.resistance = 0.8;
    
    [animator addBehavior:gravity];
    [animator addBehavior:collision];
    [animator addBehavior:item];
    
    self.animator = animator;
}

@end
