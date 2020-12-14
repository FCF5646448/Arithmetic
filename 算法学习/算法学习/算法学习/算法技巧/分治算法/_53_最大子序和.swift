//
//  _53_最大子序和.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/7/14.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation
class Deconcentrate {
    /*
     给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

     示例:

     输入: [-2,1,-3,4,-1,2,1,-5,4],
     输出: 6
     解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/maximum-subarray
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     两种解法：
     1、暴力法：使用两个指针滑动获取
     2、分治法：
     */
    
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var newArr = nums
        return mergeArr(&newArr, 0, newArr.count)
    }
    
    func mergeArr(_ nums:inout [Int], _ begin:Int, _ end:Int) -> Int {
        guard end - begin > 1 else {
            return nums[begin]
        }
        let mid = (begin + end) >> 1
        
        var i = mid - 1
        var maxLeft = Int.min
        var sum = 0
        while i >= begin {
            sum += nums[i]
            maxLeft = max(maxLeft, sum)
            i -= 1
        }
        
        i = mid
        sum = 0
        var maxRight = Int.min
        while i < end {
            sum += nums[i]
            maxRight = max(maxRight, sum)
            i += 1
        }
        
        let tempMax = max(mergeArr(&nums, begin, mid) , mergeArr(&nums, mid, end))
        
        return max((maxLeft + maxRight), tempMax)
    }
    
    
    
    
    
    func maxSubArray1(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return Int.min
        }
        var maxSum = Int.min
        var begin = 0
        while begin < nums.count {
            var end = begin
            var sum = 0
            while end < nums.count {
                sum += nums[end]
                maxSum = max(maxSum, sum)
                
                end += 1
            }
            begin += 1
        }
        return maxSum
    }
}

