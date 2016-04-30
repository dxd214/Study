//
//  NewViewController.m
//  09_模态出控制器
//
//  Created by Chiang on 16/3/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickToDismiss:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(newViewControllerDidDismissWith:)]) {
        [self.delegate newViewControllerDidDismissWith:self];
    }
}

-(void)dealloc {
    NSLog(@"newViewController dealloc.......");
}

@end
