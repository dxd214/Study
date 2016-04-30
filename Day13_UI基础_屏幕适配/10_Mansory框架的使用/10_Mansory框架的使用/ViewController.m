//
//  ViewController.m
//  10_Mansory框架的使用
//
//  Created by Chiang on 16/2/12.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

#warning #define MAS_SHORTHAND必须定义在#import "Masonry.h"前，否则会引起编译问题。
#define MAS_SHORTHAND
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *redView = [[UIView alloc] init];
    [self.view addSubview:redView];
    [redView setBackgroundColor:[UIColor redColor]];
    
    // 第一种写法：
    // make指代被约束的view：
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        // 顶部：
//        make.top.equalTo(self.view.mas_top).offset(20);
//        // 左侧：
//        make.left.equalTo(self.view.mas_left).offset(20);
//        // 右侧：
//        make.right.equalTo(self.view.mas_right).offset(-20);
//        // 高度：
//        make.height.mas_equalTo(50);
//    }];
    
    // 第二种写法：
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(20);
//        make.left.equalTo(self.view).offset(20);
//        make.right.equalTo(self.view).offset(-20);
//        make.height.mas_equalTo(50);
//    }];
    
    // 第三种写法：
//    [redView makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 20, 20, 20));
//    }];
    
    // 如果想要省略mas_xxxxx，则需要宏定义#define MAS_SHORTHAND
    
    // 第四种写法：
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(20);
        make.right.offset(-20);
        make.height.mas_equalTo(50);
    }];
    
    // 更新约束：
    [redView updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
    }];
    
    // 清空所有约束：
    [redView remakeConstraints:^(MASConstraintMaker *make) {
        NSLog(@"%s", __func__);
    }];
}

@end
