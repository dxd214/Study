//
//  ViewController2.m
//  04_导航控制器的基本使用
//
//  Created by Chiang on 16/2/16.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.navigationItem.title = @"YellowView";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(didClick)];
}

-(void)didClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickToInToBlueViewController {
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    [self.navigationController pushViewController:vc3 animated:YES];
}

- (IBAction)clickToBackToRedViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc
{
    NSLog(@"yellowView dealloc.....");
}

@end
