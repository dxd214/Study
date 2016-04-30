//
//  ViewController.swift
//  03_switch语句
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        demo()
//        demo2()
//        demo3()
//        demo4()
        demo5()
    }
    
    // switch语句的break可以省略。
    // 但是swift的switch语句不具备穿透功能，每一个case下面，必须要有一段可执行的语句。
    func demo() {
        let num = 1500
        switch num {
        case 1800, 1900:
            print("YaoMing")
        case 1500:
            print("Howard")
        default:
            print("James")
        }
    }
    
    // 循环语句：
    func demo2() {
        for var i = 0; i < 20; i++ {
            print(i)
        }
    }
    
    func demo3() {
        // 这种写法表示取出在0到20的数字依次打印，不包含20
        for i in 0..<20 {
            print(i)
        }
    }
    
    func demo4() {
        // 这种写法则是包含20
        for i in 0...20 {
            print(i)
        }
    }
    
    func demo5() {
        // 这种写法表示忽略条件语句，直接把花括号内部的语句打印20次。
        for _ in 0..<20 {
            print("YaoMing")
        }
    }
}

