//: Playground - noun: a place where people can play

import UIKit

// 方法：
func run() {
    print("----------")
}
// 调用：
run()

// 有参数：
func printStr(str: String) {
    print(str)
}
printStr("YaoMing Fuck Howard....")

// 有返回值：
func getStr() -> String {
    return "YiJianLian"
}
let str = getStr()

// 有参数、有返回值：
func getSum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
let sum = getSum(5, num2: 8)
print(sum)

