//
//  MessageCell.m
//  01_QQ聊天界面
//
//  Created by SteveChiang on 16/1/31.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "MessageCell.h"
#import "MessageFrameModel.h"
#import "MessageModel.h"

@interface MessageCell ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIButton *textButton;

@end

@implementation MessageCell

+(instancetype)messageCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseID = @"Message";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconImageView = [[UIImageView alloc] init];
        self.iconImageView = iconImageView;
        [self.contentView addSubview:iconImageView];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        self.timeLabel = timeLabel;
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.font = [UIFont systemFontOfSize:13.0f];
        [self.contentView addSubview:timeLabel];
        
        UIButton *textButton = [[UIButton alloc] init];
//        [textButton setBackgroundColor:[UIColor orangeColor]];
        textButton.titleLabel.font = [UIFont systemFontOfSize:17.0f];
        textButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        textButton.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:textButton];
        self.textButton = textButton;
    }
   return self;
}

-(void)setMessageFrameModel:(MessageFrameModel *)messageFrameModel
{
    _messageFrameModel = messageFrameModel;
    
    MessageModel *message = messageFrameModel.message;
    self.iconImageView.frame = messageFrameModel.iconFrame;
    self.timeLabel.frame = messageFrameModel.timeFrame;
    self.textButton.frame = messageFrameModel.textFrame;
    
    if (message.type == MessageTypeSelf) {
        self.iconImageView.image = [UIImage imageNamed:@"me"];
    } else {
        self.iconImageView.image = [UIImage imageNamed:@"other"];
    }

    UIImage *norImage = nil;
    UIImage *highImage = nil;
    UIColor *fontColor = nil;
    
    if (message.type == MessageTypeSelf) {
        norImage = [self stretchImage:@"chat_send_nor"];
        highImage = [self stretchImage:@"chat_send_press_pic"];
        fontColor = [UIColor whiteColor];
    } else {
        norImage = [self stretchImage:@"chat_recive_nor"];
        highImage = [self stretchImage:@"chat_recive_press_pic"];
        fontColor = [UIColor blackColor];
    }
    
    [self.textButton setBackgroundImage:norImage forState:UIControlStateNormal];
    [self.textButton setBackgroundImage:highImage forState:UIControlStateHighlighted];
    [self.textButton setTitleColor:fontColor forState:UIControlStateNormal];
    
    self.timeLabel.text = message.time;
    NSLog(@"%@", message.time);
    [self.textButton setTitle:message.text forState:UIControlStateNormal];
}

-(UIImage *)stretchImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat halfWidth = image.size.width * 0.5 + 10;
    CGFloat halfHeight = image.size.height * 0.5 + 10;
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(halfHeight, halfWidth, halfHeight, halfWidth) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}

@end
