//
//  AppCell.m
//  08_异步下载图片
//
//  Created by Chiang on 16/2/23.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"

@interface AppCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSMutableDictionary *dict;

@end

@implementation AppCell

-(void)layoutSubviews {
    [super layoutSubviews];
    
    NSLog(@"%s", __func__);
    NSLog(@"%@", NSStringFromCGRect(self.frame));
}

-(NSMutableDictionary *)dict {
    if (!_dict) {
        _dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

-(void)setApp:(AppModel *)app {
    _app = app;
    
    self.iconImageView.image = [UIImage imageNamed:@"user_default"];
    
    if (!self.dict[app.icon]) {
        if (!app.iconImage) {
            NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                UIImage *iconImage = [self downloadImage:app.icon];
                app.iconImage = iconImage;
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.iconImageView.image = app.iconImage;
                    self.nameLabel.text = app.name;
                    self.downloadLabel.text = [NSString stringWithFormat:@"已下载%@次", app.download];
                }];
            }];
            
            // 将操作存入缓存：
            [self.dict setValue:operation forKey:app.icon];
            [self.queue addOperation:operation];
        } else {
            NSLog(@"图片已经存在..........");
//            return;
        }
    } else {
        NSLog(@"app已在下载....");
//        return;
    }
}

-(UIImage *)downloadImage:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return [UIImage imageWithData:data];
}

@end
