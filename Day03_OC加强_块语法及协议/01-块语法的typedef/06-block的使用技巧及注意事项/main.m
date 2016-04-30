//
//  main.m
//  06-block的使用技巧及注意事项
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

void test(int (^myBlock)(int, int))
{
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // inlineBlock
//        <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
//            <#statements#>
//        };
        
        test(^int(int, int) {
            
        })
    }
    return 0;
}
