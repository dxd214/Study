//: Playground - noun: a place where people can play

import UIKit

// swift特有写法循环
for i in 0 ..< 10 {
    print(i)
}

// _代表忽略，表示不会用到变量。
for _ in 0 ..< 10 {
    print("YaoMing")
}

var a = 10
while a < 10 {
    print(a)
    a += 1
}

// swift升级到2.0后，do...while没有do了，因为do被用作捕获异常了，do换用repeat。
var b = 0
repeat {
    print(b)
    b += 1
} while b < 10
