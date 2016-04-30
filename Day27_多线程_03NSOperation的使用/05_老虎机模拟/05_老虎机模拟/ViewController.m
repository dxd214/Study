//
//  ViewController.m
//  05_老虎机模拟
//
//  Created by Chiang on 16/2/22.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (nonatomic, strong) NSOperationQueue *queue;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

-(void)random {
    while (!self.queue.suspended) {
        [NSThread sleepForTimeInterval:0.08f];
        
        int number1 = arc4random_uniform(10);
        int number2 = arc4random_uniform(10);
        int number3 = arc4random_uniform(10);
        NSLog(@"%@", [NSThread currentThread]);
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.label2.text = [NSString stringWithFormat:@"%d", number2];
            self.label1.text = [NSString stringWithFormat:@"%d", number1];
            self.label3.text = [NSString stringWithFormat:@"%d", number3];
            NSLog(@"%@", [NSThread currentThread]);
        }];
    }
}

- (IBAction)clickToPlay {
    if (self.queue.operationCount == 0) {
        [self.playButton setTitle:@"OK" forState:UIControlStateNormal];
        [self.queue addOperationWithBlock:^{
            [self random];
        }];
        [self.queue setSuspended:NO];
    } else {
        [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
        [self.queue setSuspended:YES];
    }
}

@end
