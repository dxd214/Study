//
//  FooterView.m
//  01_团购简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "FooterView.h"

@interface FooterView ()

@property (weak, nonatomic) IBOutlet UIButton *loadingBtn;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation FooterView

+(instancetype)footerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil] lastObject];
}

- (IBAction)clickToLoading {
    self.loadingBtn.hidden = YES;
    self.loadingView.hidden = NO;
    
    if ([self.delegate respondsToSelector:@selector(footerView:andLoadingBtn:andLoadingView:)]) {
        [self.delegate footerView:self andLoadingBtn:self.loadingBtn andLoadingView:self.loadingView];
    }
}

@end
