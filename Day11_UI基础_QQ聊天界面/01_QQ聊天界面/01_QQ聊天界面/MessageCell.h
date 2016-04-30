//
//  MessageCell.h
//  01_QQ聊天界面
//
//  Created by SteveChiang on 16/1/31.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageFrameModel;

@interface MessageCell : UITableViewCell

@property (nonatomic, strong) MessageFrameModel *messageFrameModel;

+(instancetype)messageCellWithTableView:(UITableView *)tableView;

@end
