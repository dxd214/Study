//
//  EditingContactController.h
//  01_私人通讯录
//
//  Created by Chiang on 16/2/19.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactModel, EditingContactController;

@protocol EditingContactControllerDelegate <NSObject>

-(void)editingContactController:(EditingContactController *)editingContactController;

@end

@interface EditingContactController : UIViewController

@property (nonatomic, strong) ContactModel *contact;

@property (nonatomic, weak) id<EditingContactControllerDelegate> delegate;

@end
