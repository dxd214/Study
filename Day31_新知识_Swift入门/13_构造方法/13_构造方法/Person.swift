//
//  Person.swift
//  13_构造方法
//
//  Created by JiangDi on 16/5/27.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class Person: NSObject {
    // 如果是定义一个对象属性，那么类型后面可以跟上一个？
    // 如果是定义一个基本属性，那么建议先直接赋值。
    var name: String?
    var age: Int = 0
    
    // override修饰的方法代表这个方法是重写父类的：
    override init() {
        self.name = "YaoMing"
        self.age = 35
    }
    
    // swift中允许方法重载：
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    init(dict: [String: NSObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
}
