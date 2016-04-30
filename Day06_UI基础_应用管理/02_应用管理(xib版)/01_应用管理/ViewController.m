//
//  ViewController.m
//  01_应用管理
//
//  Created by SteveChiang on 16/1/27.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "OuterView.h"

// 列数：
#define kColumn 3

@interface ViewController ()

// 相比NSArray，NSMutableArray更加消耗性能：
@property (nonatomic, strong) NSArray *appsList;

@end

@implementation ViewController

// 懒加载：
-(NSArray *)appsList
{
    if (!_appsList) {
        _appsList = [AppModel appsArray];
    }
    return _appsList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 测试：
    NSLog(@"get前---%@", _appsList);
    // 不调用一次get方法，appsList内没有数据：
    NSLog(@"%@", self.appsList);
    NSLog(@"get后---%@", _appsList);
    
    for (int i = 0; i < self.appsList.count; i++) {
        NSLog(@"第%d行，第%d列", i / kColumn, i %kColumn);
    }
    
    // view的尺寸：
    CGFloat outerWidth = 80;
    CGFloat outerHeight = 110;
    // 计算间距：
    CGFloat margin = (self.view.frame.size.width - kColumn * outerWidth) / (kColumn  + 1);
    
    // 循环加入子控件：
    for (int i = 0; i < self.appsList.count; i++) {
        // 行和列：
        NSInteger rowIndex = i / kColumn;
        NSInteger colIndex = i % kColumn;
        
        // 计算view的坐标：
        CGFloat outerX = margin * (colIndex + 1) + outerWidth * colIndex;
        CGFloat outerY = margin * (rowIndex + 1) + outerHeight * rowIndex;
        
        // 加载xib：
        OuterView *outerView = [OuterView outerView];
        outerView.frame = CGRectMake(outerX, outerY, outerWidth, outerHeight);
        
        [self.view addSubview:outerView];
        
        // 取出模型对象：
        AppModel *app = self.appsList[i];
        // 设置数据：
        outerView.app = app;
        
        
        // 获取outerView的所有子控件：
//        NSArray *subViews = outerView.subviews;
//        // 通过索引从outerView的子控件中逐一取出子控件：
//        UIImageView *iconImageView = subViews[0];
//        UILabel *titleLabel = subViews[1];
//        
//        // 设置数据：
//        iconImageView.image = [UIImage imageNamed:app.icon];
//        titleLabel.text = app.name;
    }
}

@end
