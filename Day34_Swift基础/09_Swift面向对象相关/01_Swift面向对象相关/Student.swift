//
//  Student.swift
//  01_Swift面向对象相关
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class Student: Person {
    override init() {
        super.init()
        name = "YiJianLian"
        age = 27
    }
    
    init(name:String, age:Int) {
        // 参数名和属性名相同时，属性名需要加上self来区分。
        super.init()
        self.name = name
        self.age = age
    }
}
