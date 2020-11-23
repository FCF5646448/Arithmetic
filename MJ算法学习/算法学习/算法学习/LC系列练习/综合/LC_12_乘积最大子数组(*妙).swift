//
//  LC_12_乘积最大子数组.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/20.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension LC {
    /*
     乘积最大子数组
     给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

      

     示例 1:

     输入: [2,3,-2,4]
     输出: 6
     解释: 子数组 [2,3] 有最大乘积 6。
     示例 2:

     输入: [-2,0,-1]
     输出: 0
     解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。

     作者：力扣 (LeetCode)
     链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xmk3rv/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    /*
     同样使用动态规划的方式去做：
     因为它不能仅仅用：当前字符串i的最大乘积和 = 子串i-1的最大乘积和 * i
     它得考虑正负数的情况。
     所以可以先用一个数组存储当前字符串i的最大乘积和，然后用另一个数组存储当前字符串i的最小乘积和。
     
     max(i) = max( max(i-1)*nums[i] , min(i-1)*nums[i], nums[i])
     min(i) = min( max(i-1)*nums[i] , min(i-1)*nums[i], nums[i])
     
     */
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var maxN = Array(repeating: 0, count: nums.count)
        var minN = Array(repeating: 0, count: nums.count)
        maxN[0] = nums[0]
        minN[0] = nums[0]
        
        for i in 1..<nums.count {
            let n = nums[i]
            let tempMax = max(minN[i-1] * n, n)
            let tempMin = min(minN[i-1] * n, n)
            
            maxN[i] = max( maxN[i-1] * n , tempMax)
            minN[i] = min( maxN[i-1] * n , tempMin)
            
        }
        
        var result = maxN[0]
        for i in 1..<maxN.count {
            result = max(result, maxN[i])
        }
        
        return result
    }
    
}
