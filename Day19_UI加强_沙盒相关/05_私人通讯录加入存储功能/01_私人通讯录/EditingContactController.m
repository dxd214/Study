//
//  EditingContactController.m
//  01_私人通讯录
//
//  Created by Chiang on 16/2/19.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "EditingContactController.h"
#import "ContactModel.h"

@interface EditingContactController ()

@property (weak, nonatomic) IBOutlet UITextField *editNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *editTelTextField;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

@end

@implementation EditingContactController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@--%@", self.contact.contactName, self.contact.contactTel);
    
    self.editNameTextField.text = self.contact.contactName;
    self.editTelTextField.text = self.contact.contactTel;
    
    self.editNameTextField.enabled = NO;
    self.editTelTextField.enabled = NO;
    self.confirmButton.enabled = NO;
}

- (IBAction)clickToEditingContactInfo:(UIBarButtonItem *)sender {
    if (self.confirmButton.enabled == NO) {
        sender.title = @"取消";
        self.editNameTextField.enabled = YES;
        self.editTelTextField.enabled = YES;
        self.confirmButton.enabled = YES;
        // 设置第一响应者：
        [self.editTelTextField becomeFirstResponder];
    } else {
        sender.title = @"编辑";
        self.editNameTextField.enabled = NO;
        self.editTelTextField.enabled = NO;
        self.confirmButton.enabled = NO;
        
        // 还原文本框中的联系人数据：
        self.editNameTextField.text = self.contact.contactName;
        self.editTelTextField.text = self.contact.contactTel;
    }
}

- (IBAction)clickToConfirmResult {
    self.contact.contactName = self.editNameTextField.text;
    self.contact.contactTel = self.editTelTextField.text;
    
    if ([self.delegate respondsToSelector:@selector(editingContactController:)]) {
        [self.delegate editingContactController:self];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
