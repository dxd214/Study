//
//  RedViewController.m
//  06_导航控制器传值
//
//  Created by Chiang on 16/2/17.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "RedViewController.h"
#import "BlueViewController.h"

@interface RedViewController ()

@property (nonatomic, weak) UITextField *redTextField;

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"redView";
    [self.view setBackgroundColor:[UIColor redColor]];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 150, self.view.frame.size.width - 40, 40)];
    [textField setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"%@", textField);
    [self.view addSubview:textField];
    self.redTextField = textField;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)didClick {
    BlueViewController *blueVC = [[BlueViewController alloc] init];
    blueVC.content = self.redTextField.text;
//    NSLog(@"%@", self.textField.text);
    
    [self.navigationController pushViewController:blueVC animated:YES];
}

@end
