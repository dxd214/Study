//
//  ContactController.m
//  01_私人通讯录
//
//  Created by Chiang on 16/2/18.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ContactController.h"
#import "AddContactController.h"
#import "ContactCell.h"
#import "ContactModel.h"
#import "AddContactController.h"
#import "EditingContactController.h"

@interface ContactController () <AddContactControllerDelegate, EditingContactControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contactsArray;

@end

@implementation ContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSMutableArray *)contactsArray {
    if (!_contactsArray) {
        _contactsArray = [NSMutableArray array];
    }
    return _contactsArray;
}

// 点击注销：
- (IBAction)clickToLogout:(UIBarButtonItem *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认要注销吗？" preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    // 弹出提示框：
    [self presentViewController:alertController animated:YES completion:nil];
}

// 点击进入编辑模式：
- (IBAction)clickToEditing:(UIBarButtonItem *)sender {
//    self.tableView.editing = !self.tableView.editing;
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *targetController = segue.destinationViewController;

    // 判断目标控制器的类型：
    if ([targetController isKindOfClass:[AddContactController class]]) {
        AddContactController *addController = (AddContactController *)targetController;
        addController.delegate = self;
    } else if ([targetController isKindOfClass:[EditingContactController class]]) {
        EditingContactController *editingController = (EditingContactController *)targetController;
        editingController.delegate = self;
        
        // 获取当前点击的indexPath：
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        // 根据indexPath获取对应的联系人对象：
        ContactModel *contact = self.contactsArray[indexPath.row];
        // 赋值:
        editingController.contact = contact;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseableID = @"ContactCell";
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseableID];
    
    ContactModel *contact = self.contactsArray[indexPath.row];
    cell.contact = contact;
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __func__);
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除数据源
        [self.contactsArray removeObjectAtIndex:indexPath.row];
        // 删除对应的cell：
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        ContactModel *contact = [[ContactModel alloc] init];
        contact.contactName = @"SunYue";
        contact.contactTel = @"18244251990";
        
        // 插入元素：
        [self.contactsArray insertObject:contact atIndex:indexPath.row + 1];
        // 插入cell：
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row %2 == 0) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

#pragma mark - AddContactController delegate

-(void)addContactWithAddContactController:(AddContactController *)addContactController andContactModel:(ContactModel *)contact {
    [self.contactsArray addObject:contact];
    NSLog(@"%@--%@", contact.contactName, contact.contactTel);
    [self.tableView reloadData];
    NSLog(@"%@", self.contactsArray);
}

#pragma mark - EditingContactController delegate

-(void)editingContactController:(EditingContactController *)editingContactController {
    NSLog(@"%@------------>", editingContactController.contact.contactName);
    [self.tableView reloadData];
}

@end
