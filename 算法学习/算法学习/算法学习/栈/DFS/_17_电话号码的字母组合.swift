//
//  _17_电话号码的字母组合.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/23.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension DFS {
    /*
     17. 电话号码的字母组合
     给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

     给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母

     2: abc
     3: def
     4: ghi
     5: jkl
     6: mno
     7: pqrs
     8: tuv
     9: wxyz

     示例:

     输入："23"
     输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
     */
    
    // 原始的类方法
    private class letterCombination {
        var numStr: [Character]! //存储的是数字字符串，"23"
        var strings: [Character]! //用于临时存储每一条路径的结果，数量等于numStr的数量
        var list: [String] = []
        var letter: [[Character]] = [["a","b","c"],["d","e","f"],["g","h","i"],["j","k","l"],["m","n","o"],["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
        
        func letterCombinations(_ digits: String) -> [String] {
            if digits == "" {
                return []
            }
            numStr = Array(digits)
            strings = [Character](repeating: Character("0"), count: numStr.count)
            dfs(0)
            return list
        }
        
        /*
         正在搜索index层
         */
        private func dfs(_ index:Int) {
            // 已经进入到最后一层了，不能再深入了
            if index == numStr.count  {
                // 得到了一个正确的解
                list.append(String(strings))
                // 返回就自动回溯了
                return
            }
            // 先枚举这一层可以做的所有选择
            let digit = numStr[index]
            let subletter = letter[Int(String(digit))! - 2]
            for c in subletter {
                //
                strings[index] = c
                
                dfs(index + 1)
            }
        }
    }
    
    // 将上面代码的成员变量参数化
    func letterCombinations(_ digits: String) -> [String] {
        if digits == "" {
            return []
        }
        
        let numStr = Array(digits)
        var strings = [Character](repeating: Character("0"), count: numStr.count)
        var list: [String] = []
        
        dfs(0, numStr, &strings, &list)
        
        return list
    }
    
    func dfs(_ idx: Int, _ numStr: [Character], _ strings: inout [Character], _ list: inout [String]) {
        if numStr.count == idx {
            list.append(String(strings))
            return
        }
        // 先枚举这一层可以做的所有选择
        let digit = numStr[idx]
        let subletter = letter[Int(String(digit))! - 2]
        for c in subletter {
            strings[idx] = c
            dfs(idx + 1, numStr, &strings, &list)
        }
    }
    
}

