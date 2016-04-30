//
//  FriendCell.h
//  01_QQ好友分组
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendModel;

@interface FriendCell : UITableViewCell

@property (nonatomic, strong) FriendModel *friendModel;

+(instancetype)friendCellWithTableView:(UITableView *)tableView;

@end
