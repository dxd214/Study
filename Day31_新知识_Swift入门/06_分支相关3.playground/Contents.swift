//: Playground - noun: a place where people can play

import UIKit

let num = 5

if num == 5 {
    print(5)
} else {
    print(10)
}

// 三目运算：
let result = (num == 6) ? 5 : 10
print(result)

// 可选类型(?)，代表可以有，也可以没有：
let url = NSURL(string: "http://www.baidu.com")
print(url)