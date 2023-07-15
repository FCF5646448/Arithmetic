//
//  _164_最大间距.swift
//  算法学习
//
//  Created by 冯才凡 on 2020/9/16.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

extension Solution {
    /*
     给定一个无序的数组，找出数组在排序之后，相邻元素之间最大的差值。

     如果数组元素个数小于 2，则返回 0。

     示例 1:

     输入: [3,6,9,1]
     输出: 3
     解释: 排序后的数组是 [1,3,6,9], 其中相邻元素 (3,6) 和 (6,9) 之间都存在最大差值 3。
     示例 2:

     输入: [10]
     输出: 0
     解释: 数组元素个数小于 2，因此返回 0。
     说明:

     你可以假设数组中所有元素都是非负整数，且数值在 32 位有符号整数范围内。
     请尝试在线性时间复杂度和空间复杂度的条件下解决此问题。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/maximum-gap
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func maximumGap(_ nums: [Int]) -> Int {
        
        func quick(_ nums: inout [Int], _ left: Int, _ right: Int) {
            if left > right {
                return
            }
            var l = left
            var r = right
            let temp = nums[left]
            
            
            while l < r {
                // 这里的=号需要特别注意
                while l < r && nums[r] >= temp {
                    r -= 1
                }
                while l < r && nums[l] <= temp {
                    l += 1
                }
                
                if l < r { //这个判断需要特别注意
                    let t = nums[l]
                    nums[l] = nums[r]
                    nums[r] = t
                }
            }
            
            nums[left] = nums[l]
            nums[l] = temp
            
            quick(&nums, left, l - 1)
            quick(&nums, l + 1, right)
        }
        
        guard nums.count > 1 else {
            return 0
        }
        
        var tempArr = nums
        quick(&tempArr, 0, tempArr.count - 1)
        
        var i = 1
        var max = tempArr[i] - tempArr[0]
        i += 1
        while i < tempArr.count {
            let temp = tempArr[i] - tempArr[i - 1]
            if temp > max {
                max = temp
            }
            i += 1
        }
        
        return max
    }
}
