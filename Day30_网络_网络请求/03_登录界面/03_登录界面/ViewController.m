//
//  ViewController.m
//  03_登录界面
//
//  Created by Chiang on 16/2/26.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

#define kUsername @"username"
#define kPassword @"password"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 取出偏好设置中的帐号和密码：
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (userDefaults) {
        NSString *username = [userDefaults valueForKey:kUsername];
        NSString *password = [userDefaults valueForKey:kPassword];
        
        self.usernameTextField.text = username;
        self.passwordTextField.text = password;
    } else {
        NSLog(@"没有检测到偏好设置.....");
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [NSUserDefaults resetStandardUserDefaults];
//    userDefault
}

- (IBAction)clickToLogin:(UIButton *)sender {
    if (!self.usernameTextField.text.length && !self.passwordTextField.text.length) {
        NSLog(@"请输入账户和密码.....");
    } else {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://127.0.0.1/login/login.php"]];
        request.HTTPMethod = @"POST";
        
        NSString *bodyStr = [NSString stringWithFormat:@"username=%@&password=%@", self.usernameTextField.text, self.passwordTextField.text];
        request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        
        [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                // 解析JSON数据：
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                
                if (dict[@"userId"]) {
                    NSLog(@"登录成功.....");
                    
                    // 本地存储账户数据：
                    // userDefaults是一个单例：
                    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                    [userDefaults setObject:self.usernameTextField.text forKey:kUsername];
                    [userDefaults setObject:self.passwordTextField.text forKey:kPassword];
                    [userDefaults synchronize];
                } else {
                    NSLog(@"登录失败.....");
                }
            } else {
                NSLog(@"没有数据....");
            }
        }] resume];
    }
}

@end
