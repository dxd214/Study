//
//  MessageFrameModel.h
//  01_QQ聊天界面
//
//  Created by SteveChiang on 16/1/31.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageModel;

@interface MessageFrameModel : UIView

@property (nonatomic, strong) MessageModel *message;

@property (nonatomic, assign) CGRect iconFrame;
@property (nonatomic, assign) CGRect timeFrame;
@property (nonatomic, assign) CGRect textFrame;
@property (nonatomic, assign) CGFloat cellHeight;

@end
