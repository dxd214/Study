//
//  WeiboFrameModel.h
//  02_微博简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeiboModel;

@interface WeiboFrameModel : UIView

@property (nonatomic, assign) CGRect iconFrame;
@property (nonatomic, assign) CGRect nameFrame;
@property (nonatomic, assign) CGRect textFrame;
@property (nonatomic, assign) CGRect pictureFrame;
@property (nonatomic, assign) CGRect vipFrame;
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) WeiboModel *weibo;

@end
