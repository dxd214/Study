//
//  ViewController.swift
//  04_Swift字符串相关
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        demo1()
//        demo2()
//        demo3()
        demo4()
    }
    
    func demo1() {
        let str = "James Fuck Kobe"
        // 遍历字符串：
        for s in str.characters {
            print(s)
        }
        
        // 长度：
        let length = str.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        print(length)
    }

    // 字符串的拼接：
    func demo2() {
        let str = "雅蠛蝶"
        let str2 = "一库哟"
        print(str + str2)
    }
    
    // 字符串的比较：
    func demo3() {
        let str = "黄鹤，你不是人，还我血汗钱..."
        let str2 = "雅蠛蝶，一库哟"
        
        if str == str2 {
            print("=========")
        } else {
            print("!!!======")
        }
    }
    
    func demo4() {
        let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        // as表示截取类型：
        let newStr = (str as NSString).substringWithRange(NSMakeRange(6, 5))
        print(newStr)
    }
}