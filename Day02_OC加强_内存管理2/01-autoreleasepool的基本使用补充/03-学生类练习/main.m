//
//  main.m
//  03-学生类练习
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *student = [Student studentWithAge:18];
        NSLog(@"student.age == %d", student.age);
        
        Student *student2 = [[Student alloc] initWithAge:20];
        NSLog(@"student2.age == %d", student2.age);
    }
    return 0;
}
