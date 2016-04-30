//
//  ViewController.m
//  01_QQ聊天界面
//
//  Created by SteveChiang on 16/1/31.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "MessageModel.h"
#import "MessageCell.h"
#import "MessageFrameModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *messageFramesList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.tableView setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.0f]];
    self.tableView.separatorStyle = NO;
    NSLog(@"%@", self.messageFramesList);
}

-(NSMutableArray *)messageFramesList
{
    if (!_messageFramesList) {
        _messageFramesList = [MessageModel messageFramesArray];
    }
    return _messageFramesList;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFramesList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageFrameModel *messageFrameModel = self.messageFramesList[indexPath.row];
    MessageCell *cell = [MessageCell messageCellWithTableView:tableView];
    cell.messageFrameModel = messageFrameModel;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageFrameModel *messageFrameModel = self.messageFramesList[indexPath.row];
    return messageFrameModel.cellHeight;
}

@end
