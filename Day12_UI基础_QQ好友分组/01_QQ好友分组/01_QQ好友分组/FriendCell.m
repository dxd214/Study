//
//  FriendCell.m
//  01_QQ好友分组
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "FriendCell.h"
#import "FriendModel.h"

@implementation FriendCell

- (void)awakeFromNib {
    NSLog(@"%s", __func__);
}

+(instancetype)friendCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseID = @"Friend";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FriendCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setFriendModel:(FriendModel *)friendModel
{
    _friendModel = friendModel;
    
    self.imageView.image = [UIImage imageNamed:friendModel.icon];
    self.textLabel.text = friendModel.name;
    self.detailTextLabel.text = friendModel.intro;
}

@end
