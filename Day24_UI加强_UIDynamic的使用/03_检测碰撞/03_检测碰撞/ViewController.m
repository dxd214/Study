//
//  ViewController.m
//  03_检测碰撞
//
//  Created by Chiang on 16/3/15.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBlue = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    UIGravityBehavior *gravityRed = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView, self.blueView]];
    
    {
        CGPoint center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
        CGFloat radius = 120;
        CGFloat start = 0;
        CGFloat end = 2 * M_PI;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
        
        collision.translatesReferenceBoundsIntoBoundary = YES;
        [collision addBoundaryWithIdentifier:@"yao" forPath:path];
    }
    
    [animator addBehavior:gravityBlue];
    [animator addBehavior:gravityRed];
    [animator addBehavior:collision];
    
    self.animator = animator;
}

@end
