//
//  ViewController.m
//  01_QQ好友分组
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "FriendModel.h"
#import "FriendsGroupModel.h"
#import "FriendCell.h"
#import "HeaderView.h"

@interface ViewController () <HeaderViewDelegate>

@property (nonatomic, strong) NSArray *friendsGroupsArray;

@end

@implementation ViewController

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", self.friendsGroupsArray);
    // 为tableView注册一个可重用cell：
    // 省略为空判断：
//    UINib *nib = [UINib nibWithNibName:@"" bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"FriedsGroup"];
}

-(NSArray *)friendsGroupsArray
{
    if (nil == _friendsGroupsArray) {
        _friendsGroupsArray = [FriendsGroupModel friendsGroupsArray];
    }
    return _friendsGroupsArray;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friendsGroupsArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FriendsGroupModel *friendsGroup = self.friendsGroupsArray[section];
    return friendsGroup.isFoldaway ? friendsGroup.friends.count : 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendsGroupModel *friendGroup = self.friendsGroupsArray[indexPath.section];
    FriendModel *friend = friendGroup.friends[indexPath.row];
    FriendCell *cell = [FriendCell friendCellWithTableView:tableView];
    cell.friendModel = friend;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FriendsGroupModel *friendsGroup = self.friendsGroupsArray[section];
    
    static NSString *reuseID = @"HeaderView";
    HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseID];
    if (nil == headerView) {
        headerView = [[HeaderView alloc] initWithReuseIdentifier:reuseID];
    }
    
    headerView.friendsGroup = friendsGroup;
    headerView.tag = section;
    headerView.delegate = self;
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(void)headerView:(HeaderView *)headerView didClickClickGroupButton:(UIButton *)headerBtn
{
    NSLog(@"%s", __func__);
    
    headerView.revolveImageView = !headerView.revolveImageView;
    NSInteger section = headerView.tag;
    
    FriendsGroupModel *friendsGroup = self.friendsGroupsArray[section];
    friendsGroup.foldaway = !friendsGroup.foldaway;
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    
    NSLog(@"%ld", headerView.tag);
}

@end
