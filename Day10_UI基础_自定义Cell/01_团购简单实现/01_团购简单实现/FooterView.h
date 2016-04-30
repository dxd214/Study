//
//  FooterView.h
//  01_团购简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FooterView;

@protocol FooterViewDelegate <NSObject>

-(void)footerView:(FooterView *)footerView andLoadingBtn:(UIButton *)loadingBtn andLoadingView:(UIView *)loadingView;

@end

@interface FooterView : UIView

@property (nonatomic, weak) id<FooterViewDelegate> delegate;

+(instancetype)footerView;

@end
