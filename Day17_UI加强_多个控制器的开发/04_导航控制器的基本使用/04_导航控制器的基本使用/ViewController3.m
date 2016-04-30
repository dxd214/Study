//
//  ViewController3.m
//  04_导航控制器的基本使用
//
//  Created by Chiang on 16/2/16.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"BlueView";
}

- (IBAction)clickToBackToYellowViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickToBackToRootViewController {
    // 调用此方法会销毁当前控制器view：
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)clickToInToDesignatedViewController {
    
}

-(void)dealloc
{
    NSLog(@"blueView dealloc.....");
}

@end
