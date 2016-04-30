//
//  ViewController1.m
//  04_导航控制器的基本使用
//
//  Created by Chiang on 16/2/16.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"RedView";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didClick)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(didClick)];
}

-(void)didClick
{
    NSLog(@"%s", __func__);
}

- (IBAction)clickToInToYellowViewController {
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}

-(void)dealloc
{
    NSLog(@"redView dealloc.....");
}

@end
