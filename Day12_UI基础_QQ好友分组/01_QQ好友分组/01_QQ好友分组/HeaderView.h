//
//  HeaderView.h
//  01_QQ好友分组
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendsGroupModel, HeaderView;

@protocol HeaderViewDelegate <NSObject>

-(void)headerView:(HeaderView *)headerView didClickClickGroupButton:(UIButton *)headerBtn;

@end

@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

@property (nonatomic, strong) FriendsGroupModel *friendsGroup;
@property (nonatomic, assign) BOOL revolveImageView;

@end
