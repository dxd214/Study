//
//  ViewController.swift
//  07_函数相关
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let result = sum(10, b: 100)
//        print(result)
        let result = getAres(10, b: 10)
        print(result)
        
        demo("YaoMing")
    }
    
    // 基本格式：
    // func表示声明一个寒暑
    // sum函数名
    // ()为参数列表
    // -> 返回值
    func sum(a:Int, b:Int) -> Int {
        return a + b
    }
    
    func getAres(a:Int, b:Int) -> Int {
        return a * b
    }
    
    // 没有返回值：
    // 第一种写法：
    func demo(str:String) -> Void {
        print(str)
    }
    
    func demo2(str:String) -> () {
        print(str)
    }
    
    func demo3(str:String) {
        print(str)
    }

}

