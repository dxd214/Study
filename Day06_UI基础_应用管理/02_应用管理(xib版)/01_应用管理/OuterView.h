//
//  OuterView.h
//  01_应用管理
//
//  Created by SteveChiang on 16/1/27.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppModel;

@interface OuterView : UIView

@property (nonatomic, strong) AppModel *app;

+(instancetype)outerView;

@end
