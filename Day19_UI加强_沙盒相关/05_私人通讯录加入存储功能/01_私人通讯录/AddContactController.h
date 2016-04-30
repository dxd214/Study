//
//  AddContactController.h
//  01_私人通讯录
//
//  Created by Chiang on 16/2/18.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddContactController, ContactModel;

@protocol AddContactControllerDelegate <NSObject>

-(void)addContactWithAddContactController:(AddContactController *)addContactController andContactModel:(ContactModel *)contact;

@end

@interface AddContactController : UIViewController

@property (nonatomic, weak) id<AddContactControllerDelegate> delegate;

@end
