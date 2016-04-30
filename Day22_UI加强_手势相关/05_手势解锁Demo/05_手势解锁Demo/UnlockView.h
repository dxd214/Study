//
//  UnlockView.h
//  05_手势解锁Demo
//
//  Created by Chiang on 16/3/10.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UnlockView;

@protocol UnlockViewDelegate <NSObject>

-(void)unlockViewGetPassWordWithUnlockView:(UnlockView *)unlockView andPassword:(NSString *)password;

@end

@interface UnlockView : UIView

@property (nonatomic, weak) id<UnlockViewDelegate> delegate;

@end
