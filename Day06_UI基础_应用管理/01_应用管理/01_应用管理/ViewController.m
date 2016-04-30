//
//  ViewController.m
//  01_应用管理
//
//  Created by SteveChiang on 16/1/27.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"

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
        
        // init方法所有对象都可以调用，initWithFrame属于UI控件的初始化方法：
        UIView *outerView = [[UIView alloc] initWithFrame:CGRectMake(outerX, outerY, outerWidth, outerHeight)];
        // 背景：
        //            [outerView setBackgroundColor:[UIColor redColor]];
        // 加入父控件：
        [self.view addSubview:outerView];
        
        // 取出模型对象：
        AppModel *app = self.appsList[i];
        
        // 添加图标：
        CGFloat iconWidth = 60;
        CGFloat iconHeight = iconWidth;
        CGFloat iconX = (outerWidth - iconWidth) * 0.5;
        CGFloat iconY = 0;
        
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(iconX, iconY, iconWidth, iconHeight)];
//        [iconImageView setBackgroundColor:[UIColor blueColor]];
        // 设置图标：
        iconImageView.image = [UIImage imageNamed:app.icon];
        [outerView addSubview:iconImageView];
        
        // 添加标题：
        CGFloat titleWidth = outerWidth;
        CGFloat titleHeight = 20;
        CGFloat titleX = 0;
        CGFloat titleY = CGRectGetMaxY(iconImageView.frame);
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleWidth, titleHeight)];
        // 设置标题：
        titleLabel.text = app.name;
        // 居中显示：
        titleLabel.textAlignment = NSTextAlignmentCenter;
        // 字体大小：
        titleLabel.font = [UIFont systemFontOfSize:13.0f];
//        [titleLabel setBackgroundColor:[UIColor orangeColor]];
        [outerView addSubview:titleLabel];
        
        // 添加下载按钮：
        CGFloat downloadWidth = outerWidth;
        CGFloat downloadHeight = outerHeight - iconHeight - titleHeight;
        CGFloat downloadX = 0;
        CGFloat downloadY = CGRectGetMaxY(titleLabel.frame);
        
        UIButton *downlaodBtn = [[UIButton alloc] initWithFrame:CGRectMake(downloadX, downloadY, downloadWidth, downloadHeight)];
        // 设置按钮背景;
        // 普通状态：
        [downlaodBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        // 高亮状态：
        [downlaodBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        // 按钮文字：
        [downlaodBtn setTitle:@"下载" forState:UIControlStateNormal];
        // 按钮按下时文字的颜色：
        [downlaodBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        // 按钮字体大小：
        downlaodBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        
        [downlaodBtn setBackgroundColor:[UIColor greenColor]];
        [outerView addSubview:downlaodBtn];
        
        // 添加点击事件：
        [downlaodBtn addTarget:self action:@selector(clickToDownloadApp) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)clickToDownloadApp
{
    NSLog(@"%s", __func__);
}

@end
