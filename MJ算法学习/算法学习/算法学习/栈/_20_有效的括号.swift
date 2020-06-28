//
//  _20_有效的括号.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/6/27.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension ArrayList {
    func isValid(_ s: String) -> Bool {
        let right = [')',']','}']
        var subStr = s
        while subStr.contains("()") || subStr.contains("[]") || subStr.contains("{}") {
            if subStr.contains("()") {
                subStr.remove(at: <#T##String.Index#>)
            }
        }
        
    }
}
