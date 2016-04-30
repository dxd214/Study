//
//  WeiboFrameModel.m
//  02_微博简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "WeiboFrameModel.h"
#import "WeiboModel.h"

#define kMargin 10

@implementation WeiboFrameModel

-(void)setWeibo:(WeiboModel *)weibo
{
    _weibo = weibo;
    
    CGFloat iconWidth = 45;
    CGFloat iconHeight = iconWidth;
    CGFloat iconX = kMargin;
    CGFloat iconY = kMargin;
    _iconFrame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    
    CGFloat nameWidth = 150;
    CGFloat nameHeight = 44;
    CGFloat nameX = iconWidth + kMargin * 2;
    CGFloat nameY = iconY;
    _nameFrame = CGRectMake(nameX, nameY, nameWidth, nameHeight);
    
    CGFloat vipWidth = 25;
    CGFloat vipHeight = vipWidth;
    CGFloat vipX = nameWidth + kMargin;
    CGFloat vipY = iconY;
    if (weibo.vip == 0) {
        _vipFrame = CGRectMake(vipX, vipY, vipWidth, vipHeight);
    }
    
    CGSize maxSize = CGSizeMake(300, MAXFLOAT);
    CGSize textRealSize = [weibo.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0f]} context:nil].size;
    
    CGFloat textWidth = textRealSize.width;
    CGFloat textHeight = textRealSize.height;
    CGFloat textX = kMargin;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + kMargin;
    _textFrame = CGRectMake(textX, textY, textWidth, textHeight);
    
    CGFloat pictureWidth = 200;
    CGFloat pictureHeight = pictureWidth;
    CGFloat pictureX = kMargin;
    CGFloat pictureY = CGRectGetMaxY(_textFrame) + kMargin;
    _pictureFrame = CGRectMake(pictureX, pictureY, pictureWidth, pictureHeight);
    
    _cellHeight = CGRectGetMaxY(_textFrame) + kMargin;
}

@end
