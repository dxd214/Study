//
//  ViewController.m
//  02_多组数据展示
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 2;
    } else {
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    
    NSUInteger row = indexPath.row;
    NSUInteger section = indexPath.section;

    if (section == 0) {
        if (row == 0) {
            cell.textLabel.text = @"YaoMing";
        } else if (row == 1) {
            cell.textLabel.text = @"Kobe";
        } else {
            cell.textLabel.text = @"James";
        }
    } else if (section == 1) {
        if (row == 0) {
            cell.textLabel.text = @"Howard";
        } else {
            cell.textLabel.text = @"Iverson";
        }
    } else {
        cell.textLabel.text = @"YiJianLian";
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"第一队";
    } else if (section == 1) {
        return @"第二队";
    } else {
        return @"饮水机管理员";
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *titleFooter = @"";
    switch (section) {
        case 0:
            titleFooter = @"吊打一切";
            break;
        case 1:
            titleFooter = @"吊打半场";
            break;
        case 2:
            titleFooter = @"没法吊打";
            break;
        default:
            break;
    }
    return titleFooter;
}

@end
