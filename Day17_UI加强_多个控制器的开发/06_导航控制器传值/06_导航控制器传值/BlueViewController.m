//
//  BlueViewController.m
//  06_导航控制器传值
//
//  Created by Chiang on 16/2/17.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@property (nonatomic, weak) UITextField *blueTextField;

@end

@implementation BlueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"blueView";
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 150, self.view.frame.size.width - 40, 40)];
    [textField setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"%@", textField);
    [self.view addSubview:textField];
    
    self.blueTextField = textField;
    
    NSLog(@"viewDidLoad -----------------> %@", self);
}

-(void)setContent:(NSString *)content
{
    _content = content;
    NSLog(@"content == ---------------------> %@",content);
    self.blueTextField.text = content;
    
    NSLog(@"%@", self.blueTextField.text);
}

@end
