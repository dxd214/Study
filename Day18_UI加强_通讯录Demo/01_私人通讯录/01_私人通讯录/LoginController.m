//
//  LoginController.m
//  01_私人通讯录
//
//  Created by Chiang on 16/2/18.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "LoginController.h"
#import "MBProgressHUD+CZ.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UISwitch *rememberPasswordSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.loginButton.enabled = NO;
    
    // 监听文本框：
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChanged) name:UITextFieldTextDidChangeNotification object:self.usernameTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChanged) name:UITextFieldTextDidChangeNotification object:self.passwordTextField];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 文本框内容变化调用的方法：
-(void)textFieldDidChanged {
    self.loginButton.enabled = (self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0);
}

- (IBAction)clickToLogin {
    [self.view endEditing:YES];
    
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *realUsername = @"YaoMing";
    NSString *realPassword = @"123456";
    
    [MBProgressHUD showMessage:@"正在登录..." toView:self.navigationController.view];
    // 模拟延时：
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
        if ([username isEqualToString:realUsername] && [password isEqualToString:realPassword]) {
            // 手动执行segue：
            [self performSegueWithIdentifier:@"login" sender:@"123"];
        } else {
            NSLog(@"用户名或密码错误....");
            [MBProgressHUD showError:@"用户名或密码错误！" toView:self.navigationController.view];
        }
    });
}

// 滑动记住密码：
- (IBAction)slideToRememberPassword:(UISwitch *)sender {
    if (sender.isOn == NO) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

// 滑动自动登录：
- (IBAction)slideToAutoLogin:(UISwitch *)sender {
    if (sender.isOn == NO) {
        [self.rememberPasswordSwitch setOn:NO animated:YES];
    } else if (sender.isOn == YES) {
        [self.rememberPasswordSwitch setOn:YES animated:YES];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 通过sugue获取目标控制器：
    UIViewController *targetController = segue.destinationViewController;
    targetController.navigationItem.title = [NSString stringWithFormat:@"%@的联系人", self.usernameTextField.text];
}

@end
