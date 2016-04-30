//
//  ViewController.m
//  05_md5加密
//
//  Created by Chiang on 16/2/27.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *str = @"YaoMing";
    str = str.md5String;
    NSLog(@"%@", str);
    
    NSString *str2 = @"Howard";
    str2 = str2.md5String;
    NSLog(@"%@", str2);
    
    // md5加盐：
    NSString *password = @"123";
    NSString *str3 = @"cptbtptpbcptdtptp__++++>>>>??**123**das";
    [password stringByAppendingString:str3];
    
    password = password.md5String;
    NSLog(@"<----------->%@", password);
}

@end
