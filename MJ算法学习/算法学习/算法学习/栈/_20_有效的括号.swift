//
//  _20_有效的括号.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/27.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension String {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            }else {
                if stack.isEmpty {return false}
                let left = stack.removeLast()
                if left == "(" && char != ")" { return false }
                if left == "[" && char != "]" { return false }
                if left == "{" && char != "}" { return false }
            }
        }
        
        return stack.isEmpty
    }
}
