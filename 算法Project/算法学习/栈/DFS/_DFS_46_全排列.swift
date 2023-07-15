
//
//  _46_全排列.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/24.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension DFS {
    /*
     给定一个 没有重复 数字的序列，返回其所有可能的全排列。

     示例:

     输入: [1,2,3]
     输出:
     [
       [1,2,3],
       [1,3,2],
       [2,1,3],
       [2,3,1],
       [3,1,2],
       [3,2,1]
     ]

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/permutations
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    /*
     这题的关键是计算当前层的所有选择。利用一个临时数组存储是否使用
     */
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else{
            return []
        }
        
        var result: [[Int]] = []
        var item: [Int] = [Int](repeating: -1, count: nums.count)
        // 表示第i个字母已经被使用
        var used: [Bool] = [Bool](repeating: false, count: nums.count)
        dfs(0, nums, &result, &item, &used)
        
        return result
    }
    
    private func dfs(_ idx: Int, _ nums: [Int], _ result: inout [[Int]], _ item: inout [Int], _ used: inout [Bool]) {
        if idx == nums.count {
            result.append(item)
            return
        }
        
        //这一层可以做的所有选择。
        
        for i in 0..<nums.count {
            if used[i] {
                continue
            }
            item[idx] = nums[i]
            used[i] = true
            dfs(idx + 1, nums, &result, &item, &used)
            used[i] = false
        }
    }
}
