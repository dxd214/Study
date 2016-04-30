//
//  OuterView.m
//  01_应用管理
//
//  Created by SteveChiang on 16/1/27.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "OuterView.h"
#import "AppModel.h"

@interface OuterView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) UIView *coverView;

@end

@implementation OuterView

// 懒加载：
-(UIView *)coverView
{
    if (!_coverView) {
        // 创建一个遮罩：
        _coverView = [[UIView alloc] initWithFrame:self.superview.frame];
        [_coverView setBackgroundColor:[UIColor blackColor]];
        _coverView.alpha = 0.0;
    }
    return _coverView;
}

+(instancetype)outerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"OuterView" owner:nil options:nil] lastObject];
}

-(void)setApp:(AppModel *)app
{
    _app = app;
    
    self.iconImageView.image = [UIImage imageNamed:app.icon];
    self.titleLabel.text = app.name;
}

- (IBAction)clickToDownloadApp:(UIButton *)sender {
    NSLog(@"%@", self.app.name);
    
    // 将遮罩加入屏幕上：
    [self.superview addSubview:self.coverView];

    // 添加文本：
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.superview.frame.size.width, 30)];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.center = CGPointMake(self.superview.frame.size.width * 0.5, self.superview.frame.size.height * 0.5);
    [self.coverView addSubview:tipLabel];
    
    // 禁用被点击的按钮：
    sender.enabled = NO;
    
    [UIView animateWithDuration:0.5f animations:^{
        self.coverView.alpha = 0.7f;
        tipLabel.text = [NSString stringWithFormat:@"正在下载%@", self.app.name];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1.0f animations:^{
                // 重新开启按钮：
                sender.enabled = YES;
                self.coverView.alpha = 0.0f;
                tipLabel.text = @"下载完成";
            } completion:^(BOOL finished) {
                // 移除遮罩控件：
                [self.coverView removeFromSuperview];
            }];
        });
    }];
}

@end
