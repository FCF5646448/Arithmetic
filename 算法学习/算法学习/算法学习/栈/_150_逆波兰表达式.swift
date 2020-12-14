//
//  _150_逆波兰表达式.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/28.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    /*
     有效的运算符包括 +, -, *, / 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。
     
     输入: ["2", "1", "+", "3", "*"]
     输出: 9
     解释: 该算式转化为常见的中缀算术表达式为：((2 + 1) * 3) = 9
     示例 2：

     输入: ["4", "13", "5", "/", "+"]
     输出: 6
     解释: 该算式转化为常见的中缀算术表达式为：(4 + (13 / 5)) = 6
     示例 3：

     输入: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
     输出: 22
     解释:
     该算式转化为常见的中缀算术表达式为：
       ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
     = ((10 * (6 / (12 * -11))) + 17) + 5
     = ((10 * (6 / -132)) + 17) + 5
     = ((10 * 0) + 17) + 5
     = (0 + 17) + 5
     = 17 + 5
     = 22
     
     解析：
     思路就是遇到数字就入栈，遇到运算符就将最近两个数出栈，然后将计算结构入栈
     
     */
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for str in tokens {
            if str == "+" || str == "-" || str == "*" || str == "/" {
                //
                let num1 = stack.removeLast()
                let num2 = stack.removeLast()
                if str == "+" {
                    stack.append(num2 + num1)
                }else if str == "-" {
                    stack.append(num2 - num1)
                }else if str == "*" {
                    stack.append(num2 * num1)
                }else if str == "/" {
                    stack.append(num2 / num1)
                }
            }else{
                stack.append(Int(str)!)
            }
        }
        return stack.last ?? 0
    }
}
