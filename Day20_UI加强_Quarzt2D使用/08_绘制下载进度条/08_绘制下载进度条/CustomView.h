//
//  CustomView.h
//  08_绘制下载进度条
//
//  Created by Chiang on 16/3/5.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) UILabel *progressLabel;

@end
