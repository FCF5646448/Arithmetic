//
//  _53_最大连续子序列和2.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/21.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension DynamicPrograming {
    /*
     
     状态转移方程：
     dp[i] 是指以nums[i]为节点的最大连续子序列和
     if dp[i - 1] <= 0 {
     dp[i] = nums[i]
     }else{
     dp[i] = dp[i - 1] + nums[i]
     }
     
     初始状态
     dp[0] = nums[0]
     最终的解，就是max(dp[i])
     
     
     */
    
    /*
     动态规定来做：
     字符串i的最大连续子序列和 = max(字符串i-1的最大连续子序列和 + 第i个字符的大小, 字符串i-1的最大连续子序列和 )
     
     
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else{
            return 0
        }
        var dp = nums[0]
        var maxSub:Int = dp
        for i in 1..<nums.count {
            if dp <= 0 {
                dp = nums[i]
            }else{
                dp = dp + nums[i]
            }
            maxSub = max(dp, maxSub)
        }
        
        return maxSub
    }
    
    func maxSubArray1(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var maxSub: Int = dp[0]
        for i in 1..<nums.count {
            if dp[i - 1] <= 0 {
                // 0~i-1的最大子序列和<=0,那么0~i的最大子序列和就是nums[i]
                dp[i] = nums[i]
            }else{
                // 0~i-1的最大子序列和>0,那么0~i的最大子序列和就是nums[i] + dp[i - 1]
                dp[i] = dp[i-1] + nums[i]
            }
            maxSub = max(dp[i], maxSub)
        }
        return maxSub
    }
}
