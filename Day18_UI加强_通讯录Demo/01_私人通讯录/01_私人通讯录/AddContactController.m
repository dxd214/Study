//
//  AddContactController.m
//  01_私人通讯录
//
//  Created by Chiang on 16/2/18.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "AddContactController.h"
#import "ContactModel.h"

@interface AddContactController ()

@property (weak, nonatomic) IBOutlet UITextField *contactNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *contactTelTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation AddContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.addButton.enabled = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChanged) name:UITextFieldTextDidChangeNotification object:self.contactNameTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChanged) name:UITextFieldTextDidChangeNotification object:self.contactTelTextField];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.contactNameTextField becomeFirstResponder];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)textFieldDidChanged {
    self.addButton.enabled = (self.contactNameTextField.text.length > 0 && self.contactTelTextField.text.length > 0);
}

- (IBAction)clickToAddContact {
    NSString *contactName = self.contactNameTextField.text;
    NSString *contactTel = self.contactTelTextField.text;
    
    ContactModel *contact = [[ContactModel alloc] init];
    contact.contactName = contactName;
    contact.contactTel = contactTel;
    
    if ([self.delegate respondsToSelector:@selector(addContactWithAddContactController:andContactModel:)]) {
        [self.delegate addContactWithAddContactController:self andContactModel:contact];
    }
    
    NSLog(@"%@--%@", contact.contactName, contact.contactTel);
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
