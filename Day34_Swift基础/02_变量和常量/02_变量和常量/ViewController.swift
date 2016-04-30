//
//  ViewController.swift
//  02_变量和常量
//
//  Created by Chiang on 16/4/8.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        demo()
//        demo2()
        
//        print("😊🍊")
        
//        var apple = "🍎"
//        var banana = "🍌"
//        if apple == banana {
//            print("😂")
//        } else {
//            print("🚗☎️📱")
//        }
        
        demo3()
    }
    
    /**
     let 表示常量；
     var 表示变量。
     
     swift中整数的默认类型是int
     小数的默认类型是double。
     */
    func demo() {
        let a = 10
        var b = 20.3
        b = 50.5
        
        let c = Double(a) + b
        print(c);
    }
    
    // 可选项：
    // ?:可能有值，有的话那么就是那个值，没有的话就是nil；
    // !:一定有值
    func demo2() {
        var a:Int? = 10
        print(a)
    }
    
    func demo3() {
        let urlString = "https://www.baidu.com"
//        let url = NSURL(string: urlString)
//        print(url)
        
        if let url = NSURL(string: urlString) {
            
        }
    }
}

