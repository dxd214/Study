//
//  MessageFrameModel.m
//  01_QQ聊天界面
//
//  Created by SteveChiang on 16/1/31.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "MessageFrameModel.h"
#import "MessageModel.h"

#define kMargin 10
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kContentMargin 40

@implementation MessageFrameModel

-(void)setMessage:(MessageModel *)message
{
    _message = message;
    
    // 时间：
    CGFloat timeWidth = kScreenSize.width;
    CGFloat timeHeight = 44;
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    
    if (message.isTimeHidden != NO) {
        _timeFrame = CGRectMake(timeX, timeY, timeWidth, timeHeight);
    }
    
    // 头像;
    CGFloat iconWidth = 45;
    CGFloat iconHeight = iconWidth;
    CGFloat iconX = 0;
    CGFloat iconY = CGRectGetMaxY(_timeFrame) + kMargin;
    if (message.type == MessageTypeSelf) {
        iconX = kScreenSize.width - iconWidth - kMargin;
    } else {
        iconX = kMargin;
    }
    _iconFrame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    
    // 文本内容：
    // 真实文本内容：
    CGSize maxSize = CGSizeMake(kScreenSize.width - iconWidth * 2 - kMargin * 2, MAXFLOAT);
    CGSize textRealSzie = [message.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f]} context:nil].size;
    
    CGFloat textWidth = textRealSzie.width;
    CGFloat textHeight = textRealSzie.height;
    CGFloat textX = 0;
    CGFloat textY = iconY;
    if (message.type == MessageTypeSelf) {
        textX = kScreenSize.width - iconWidth - kMargin * 2 - textWidth - kContentMargin;
    } else {
        textX = kMargin * 2 + iconWidth;
    }
    _textFrame = CGRectMake(textX, textY, textWidth, textHeight);
    
    _textFrame.size.width += kContentMargin;
    _textFrame.size.height += kContentMargin;
    
    // cell的高度:
    _cellHeight = CGRectGetMaxY(_textFrame) + kMargin;
}

@end
