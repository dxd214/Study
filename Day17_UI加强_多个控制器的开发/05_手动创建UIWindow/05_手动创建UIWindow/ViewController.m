//
//  ViewController.m
//  05_手动创建UIWindow
//
//  Created by Chiang on 16/2/17.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWindow *redWindow = [[UIWindow alloc] initWithFrame:CGRectMake(50, 50, 80, 80)];
    [redWindow setBackgroundColor:[UIColor redColor]];
    redWindow.rootViewController = [[UIViewController alloc] init];
    [redWindow makeKeyAndVisible];
    [self.view addSubview:redWindow];
    
    UIWindow *greenWindow = [[UIWindow alloc] initWithFrame:CGRectMake(50, 80, 80, 80)];
    [greenWindow setBackgroundColor:[UIColor greenColor]];
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    NSLog(@"%@", windows);
    
}

@end
