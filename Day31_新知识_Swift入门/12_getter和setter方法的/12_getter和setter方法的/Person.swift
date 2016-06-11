
//
//  Person.swift
//  12_getter和setter方法的
//
//  Created by JiangDi on 16/5/27.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var _name: String?
    
    var name: String? {
        get {
            return _name
        }
        
        set {
            _name = newValue
        }
    }
    
    
    // 一般开发中的写法：
    var gender: String? {
        // 设置完gender的值的时候调用：
        didSet {
            print(gender)
        }
    }
    
    var age: Int {
        get {
            return 30
        }
    }
    
}
