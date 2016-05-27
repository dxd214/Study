//: Playground - noun: a place where people can play

import UIKit

// 定义字典：

var dict = ["name": "YaoMing", "age": 35]

let name = dict["name"]

// 遍历：
for key in dict.keys {
    print(dict[key])
}

// swift特有写法：
for (key, value) in dict {
    print(key) // key
    print(value) // value
}

// 新增值：
dict["newName"] = "YiJianLian"
let newName = dict["newName"]
print(newName)

// 删除：
dict.removeValueForKey("newName")

// 合并字典：
let dict2 = ["TF": "TaoFeng", "Wang": "JuKai"]

for (key, vaule) in dict2 {
    dict[key] = vaule
}

// 合并完成：
for (key, value) in dict {
    print(key)
    print(value)
}
