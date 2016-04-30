//
//  ViewController.m
//  02_layoutSubviews的使用
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@property (nonatomic, strong) TestView *testView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TestView *testView = [[TestView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [testView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:testView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGRect frame = self.testView.frame;
    frame.size.width += 20;
    frame.size.height += 20;
    
    self.testView.frame = frame;
}

@end
