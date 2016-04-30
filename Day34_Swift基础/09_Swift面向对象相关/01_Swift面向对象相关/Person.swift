//
//  Person.swift
//  01_Swift面向对象相关
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String?
    var age: Int?
    
    // 重写构造方法：
    override init() {
        name = "YaoMing"
        age = 35
        super.init()
    }
    
    init(dict: [String : AnyObject]) {
        setValuesForKeysWithDictionary(dict)
    }
}
