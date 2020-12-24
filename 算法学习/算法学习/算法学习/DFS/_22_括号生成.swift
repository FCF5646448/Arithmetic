//
//  _22_括号生成.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/25.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation


extension DFS {
    /*
     数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
     示例：

     输入：n = 3
     输出：[
            "((()))",
            "(()())",
            "(())()",
            "()(())",
            "()()()"
          ]

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/generate-parentheses
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    /*
     数字为n就表示有n对括号
     就表示有3个（ 和 3个 ）
     当左右括号剩余数量时一样的时候，那就只能选择左括号
     第一个肯定是左括号
     */
    
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return [""]
        }
        
        var result: [String] = []
        var tempResult:[Character] = []
        
        dfs(0, n, &result, &tempResult, n, n)
        
        return result
    }
    
    // leftNum: 左括号的剩余数量
    // rightNum右括号的剩余数量
    private func dfs(_ idx: Int, _ n: Int , _ result: inout [String], _ tempResult: inout [Character], _ leftNum: Int, _ rightNum: Int) {
        if idx == n * 2 {
            result.append(String(tempResult))
            return
        }
        
        /*
         关键
         这一层剩余的选择, 左右括号是平行关系
         */
        
        // 选择左括号，进入下一层选择
        if leftNum > 0 {
            tempResult.append("(")
            dfs(idx + 1, n, &result, &tempResult, leftNum - 1, rightNum)
            tempResult.removeLast()
        }
        
        
        // 选择右括号，进入下一层选择
        if rightNum > 0 && leftNum != rightNum {
            tempResult.append(")")
            dfs(idx + 1, n, &result, &tempResult, leftNum, rightNum - 1)
            tempResult.removeLast()
        }
    }
    
}
