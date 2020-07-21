//
//  _300_最长上升子序列.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/21.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension DynamicPrograming {
    /*
     给定一个无序的整数数组，找到其中最长上升子序列的长度。

     示例:

     输入: [10,9,2,5,3,7,101,18]
     输出: 4
     解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
     说明:

     可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
     你算法的时间复杂度应该为 O(n2) 。
     进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/longest-increasing-subsequence
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     解析:
     状态：dp[i] 表示 以nums[i]为节点的最长上升子序列长度
     每次查找第i个节点的最长上升长度的时候，都需要与前面的最长上升长度比较。
     假设比较第j个元素，
     if nums[i] > nums[j] {
        //尝试将当前节点，追加到j节点上组成一个更长的上升子序列
        dp[i] = max(dp[i],dp[j] + 1)
     }else if nums[j] > nums[i] {continue}
     
     */
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = 1
        var maxCount = dp[0]
        
        for i in 1..<nums.count {
            dp[i] = 1 //默认初始值为1
            for j in 0..<i {
                if nums[i] <= nums[j]   {
                    continue
                }
                dp[i] = max(dp[i], dp[j] + 1)
            }
            
            maxCount = max(dp[i], maxCount)
        }
        
        return maxCount
    }
}
