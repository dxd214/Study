//
//  ViewController.m
//  09_模态出控制器
//
//  Created by Chiang on 16/3/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController () <NewViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnClick:(UIButton *)sender {
    NSLog(@"%s", __func__);
    
    NewViewController *new = [[NewViewController alloc] init];
    new.delegate = self;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(barBtnDidClick)];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:new];
    new.navigationItem.rightBarButtonItem = item;
    [self presentViewController:nav animated:YES completion:^{
        NSLog(@"finished.......");
    }];
}

-(void)dealloc {
    NSLog(@"viewController dealloc.....");
}

-(void)barBtnDidClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)newViewControllerDidDismissWith:(NewViewController *)newViewController {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"diss finished......");
    }];
}

@end
