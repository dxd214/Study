//
//  ViewController.m
//  01_超级猜图
//
//  Created by SteveChiang on 16/1/28.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "QuestionModel.h"

#define kScreenSize [UIScreen mainScreen].bounds.size
#define kMargin 15
#define kButtonWidth 35
#define kOptionsCol 7

@interface ViewController ()

@property (nonatomic, strong) NSArray *questionsList;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionsView;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *coinButton;
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (nonatomic, strong) UIButton *coverBtn;


@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(NSArray *)questionsList
{
    if (!_questionsList) {
        _questionsList = [QuestionModel questionsArray];
    }
    return _questionsList;
}

// 状态栏亮色：
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)setupUI
{
    QuestionModel *question = self.questionsList[self.index];

    [self.iconButton setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    self.indexLabel.text = [NSString stringWithFormat:@"%ld / %ld", self.index + 1, self.questionsList.count];
    self.titleLabel.text = question.title;
    
    [self setupAnswerViewWith:question.answer];
    [self setupOptionsViewWith:question.options];
}

/**
 *  初始化答案区按钮：
 *
 *  @param answer 答案字符串，用于取得答案长度
 */
-(void)setupAnswerViewWith:(NSString *)answer
{
    // 清空上一题答案区控件：
//    for (UIView *view in self.answerView.subviews) {
//        [view removeFromSuperview];
//    }
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 答案长度：
    NSInteger length = answer.length;
    
    CGFloat answerWidth = kButtonWidth;
    CGFloat answerHeight = answerWidth;
    
    CGFloat startX = (self.answerView.frame.size.width - answerWidth * length - kMargin * (length - 1)) * 0.5;
    
    for (int i = 0; i < length; i++) {
        CGFloat answerX = i * answerWidth + i * kMargin + startX;
        CGFloat answerY = 0;
        
        UIButton *answerBtn = [[UIButton alloc] initWithFrame:CGRectMake(answerX, answerY, answerWidth, answerHeight)];
//        [answerBtn setBackgroundColor:[UIColor redColor]];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.answerView addSubview:answerBtn];
        
        [answerBtn addTarget:self action:@selector(clickToReturnAnswerWord:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)clickToReturnAnswerWord:(UIButton *)answerBtn
{
    if (answerBtn.currentTitle.length == 0) {
        return;
    }
    // 取出被点击按钮的文本：
    NSString *word = answerBtn.currentTitle;
    [answerBtn setTitle:@"" forState:UIControlStateNormal];
    
    [self.optionsView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *optionBtn = (UIButton *)obj;
        if ([optionBtn.currentTitle isEqualToString:word]) {
            optionBtn.hidden = NO;
            *stop = YES;
        }
    }];
    
    [self.answerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *answerBtn = (UIButton *)obj;
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }];
    
    self.optionsView.userInteractionEnabled = YES;
}

/**
 *  初始化备选区按钮：
 *
 *  @param options 用于取得备选答案个数
 */
-(void)setupOptionsViewWith:(NSArray *)options
{
    // 清空上一题按钮备选区控件：
    [self.optionsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger length = options.count;
    
    CGFloat optionWidth = kButtonWidth;
    CGFloat optionHeight = optionWidth;
    
    for (int i = 0; i < length; i++) {
        NSInteger col = i % kOptionsCol;
        NSInteger row = i / kOptionsCol;
        
        CGFloat optionX = col * optionWidth + col * kMargin;
        CGFloat optionY = row * optionHeight + row * kMargin;
        
        UIButton *optionBtn = [[UIButton alloc] initWithFrame:CGRectMake(optionX, optionY, optionWidth, optionHeight)];
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
        [optionBtn setTitle:options[i] forState:UIControlStateNormal];
        [optionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [optionBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//        [optionBtn setBackgroundColor:[UIColor blueColor]];
        [self.optionsView addSubview:optionBtn];
        
        // 添加事件监听：
        [optionBtn addTarget:self action:@selector(clickToChooseWord:) forControlEvents:UIControlEventTouchUpInside];
    }
}

// 点击相应的按钮，将按钮上的文字显示到答案区的按钮上：
-(void)clickToChooseWord:(UIButton *)optionBtn
{
    optionBtn.hidden = YES;
    NSString *word = optionBtn.currentTitle;
    
    // 遍历答案区所有按钮：
    [self.answerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *answerBtn = (UIButton *)obj;
        // 如果这个按钮没有设置文本，才进行设置，如果已经设置文本，则继续遍历下一个：
        if (answerBtn.currentTitle.length == 0) {
            [answerBtn setTitle:word forState:UIControlStateNormal];
            *stop = YES;
        }
    }];
    
    // 判断用户是否输入完成：
    // 用于记录是否输入完成：
    __block BOOL isExist = YES;
    [self.answerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *answerBtn = (UIButton *)obj;
        if (answerBtn.currentTitle.length == 0) {
            isExist = NO;
            *stop = YES;
        }
    }];
    
    // 如果答案区所有按钮都已有文字，则禁用选项区：
    if (isExist == YES) {
        self.optionsView.userInteractionEnabled = NO;
        
        // 判断答案是否正确：
        __block NSMutableString *userAnswer = [NSMutableString string];
        [self.answerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *answerBtn = (UIButton *)obj;
            [userAnswer appendString:answerBtn.currentTitle];
        }];
        
        // 取出当前问题：
        QuestionModel *question = self.questionsList[self.index];
        // 取出金币总数：
        NSInteger coinCount = self.coinButton.currentTitle.integerValue;
        
        if ([question.answer isEqualToString:userAnswer]) {
            NSLog(@"right....");
            // 进去下一题：
            // 加金币：
            coinCount += 1000;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self clickToNextQuestion];
                self.answerView.userInteractionEnabled = YES;
            });
        } else {
            NSLog(@"error....");
            // 减少金币：
            if (coinCount <= 0) {
                UIAlertView *tipAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"金币不足，请尽快充值。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [tipAlert show];
            }
            coinCount -= 1000;
            [self.answerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                UIButton *answerBtn = (UIButton *)obj;
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }];
        }
        // 重新赋值金币数量：
        [self.coinButton setTitle:[NSString stringWithFormat:@"%ld", coinCount] forState:UIControlStateNormal];
    }
}

// 点击进入下一题：
- (IBAction)clickToNextQuestion {
    if (self.index == self.questionsList.count - 1) {
        return;
    }
    
    self.index++;
    [self setupUI];
    
    // 如果已经是最后一题，则禁用按钮，否则会出现角标越界：
    self.nextButton.enabled = (self.index != self.questionsList.count - 1);
    
    self.optionsView.userInteractionEnabled = YES;
}

// 点击弹出提示：
- (IBAction)clickToAlertTheFirstWordOfAnswer {
    // 取出正确答案的第一个字：
    QuestionModel *question = self.questionsList[self.index];
    NSString *rightAnswer = question.answer;
    NSString *firstString = [rightAnswer substringToIndex:1];
    NSLog(@"%@", firstString);
    
    // 清空答案区所有文字，并将第一个文字设置到第一个按钮：
    [self.answerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *answerBtn = (UIButton *)obj;
        [answerBtn setTitle:@"" forState:UIControlStateNormal];
        
        if (idx == 0) {
            [answerBtn setTitle:firstString forState:UIControlStateNormal];
        }
    }];
    
    // 清空答案区文字后，在备选区显示相应文字：
    [self.optionsView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *optionBtn = (UIButton *)obj;
        if ([optionBtn.currentTitle isEqualToString:firstString]) {
            optionBtn.hidden = YES;
        } else {
            optionBtn.hidden = NO;
        }
    }];
    
    // 修改答案区文字颜色为黑色：
    [self.answerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *answerBtn = (UIButton *)obj;
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.optionsView.userInteractionEnabled = YES;
    }];
    
    // 减去一千金币：
    NSInteger coinCount = self.coinButton.currentTitle.integerValue;
    if (coinCount <= 0) {
        // 弹出提示alert：
//        UIAlertView *tipAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"金币不足，请尽快充值。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        [tipAlert show];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"金币不足，请尽快充值。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:cancelAction];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:YES completion:^{
            NSLog(@"finished....");
        }];
        
        return;
    }
    coinCount -= 1000;
    [self.coinButton setTitle:[NSString stringWithFormat:@"%ld", coinCount] forState:UIControlStateNormal];
}

// 点击查看大图：
- (IBAction)ClickToLargerImage {
    if (self.iconButton.frame.size.width > 230) {
        [self clickToRestoreIconImageView];
        return;
    }
    
    CGFloat iconWidth = self.view.frame.size.width;
    CGFloat iconHeight =  iconWidth;
    CGFloat iconX = 0;
    CGFloat iconY = (self.view.frame.size.height - iconHeight) * 0.5;
    
    // 添加萌版：
    UIButton *coverBtn = [[UIButton alloc] initWithFrame:self.view.bounds];
    [coverBtn setBackgroundColor:[UIColor blackColor]];
    coverBtn.alpha = 0.0f;
    self.coverBtn = coverBtn;
    
    [coverBtn addTarget:self action:@selector(clickToRestoreIconImageView) forControlEvents:UIControlEventTouchUpInside];

    [UIView animateWithDuration:1.0f animations:^{
        [self.view addSubview:coverBtn];
        coverBtn.alpha = 0.7f;
        self.iconButton.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
        [self.view bringSubviewToFront:self.iconButton];
    }];
}

-(void)clickToRestoreIconImageView
{
    [UIView animateWithDuration:1.0f animations:^{
        self.iconButton.frame = CGRectMake(72, 151, 230, 230);
        self.coverBtn.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.coverBtn removeFromSuperview];
    }];
}

@end
