//
//  _DFS_47_全排列II.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/12/24.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension DFS {
    /*
     47. 全排列 II
     给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。

     示例 1：

     输入：nums = [1,1,2]
     输出：
     [[1,1,2],
      [1,2,1],
      [2,1,1]]
     示例 2：

     输入：nums = [1,2,3]
     输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
     */
    
    /*
     该取巧时得取巧。所以直接用Set就好了
     */
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        
        guard nums.count > 0 else {
            return []
        }
        
        var result = Set<[Int]>()
        var tempResult: [Int] = []
        var used: [Bool] = [Bool](repeating: false, count: nums.count)
        dfs(0, nums, &result, &tempResult, &used)
        
        return Array(result)
    }
    
    private func dfs(_ idx:Int, _ nums: [Int], _ result: inout Set<[Int]>, _ tempResult: inout [Int], _ used: inout [Bool] ) {
        if idx == nums.count {
            result.insert(tempResult)
            return
        }
        
        for i in 0..<nums.count {
            if used[i] {
                continue
            }
            
            tempResult.append(nums[i])
            used[i] = true
            dfs(idx + 1, nums, &result, &tempResult, &used)
            tempResult.removeLast()
            used[i] = false
        }
        
    }
    
}
